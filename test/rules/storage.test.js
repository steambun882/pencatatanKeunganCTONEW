import { before, after, afterEach, test } from 'node:test';
import { readFile } from 'node:fs/promises';
import {
  initializeTestEnvironment,
  assertFails,
  assertSucceeds,
} from '@firebase/rules-unit-testing';
import { ref, uploadBytes, getBytes } from 'firebase/storage';

let testEnv;

before(async () => {
  const rules = await readFile(new URL('../../storage.rules', import.meta.url), {
    encoding: 'utf8',
  });

  testEnv = await initializeTestEnvironment({
    projectId: 'demo-pencatatan-keuangan',
    storage: {
      rules,
    },
  });
});

afterEach(async () => {
  if (testEnv) {
    await testEnv.clearStorage();
  }
});

after(async () => {
  if (testEnv) {
    await testEnv.cleanup();
  }
});

test('allows owners to upload files to their directory', async () => {
  const encoder = new TextEncoder();
  const aliceContext = testEnv.authenticatedContext('alice');
  const aliceStorage = aliceContext.storage();
  const aliceFileRef = ref(aliceStorage, 'users/alice/profile.txt');

  await assertSucceeds(uploadBytes(aliceFileRef, encoder.encode('profile')));
});

test('prevents other users from reading private files', async () => {
  const encoder = new TextEncoder();
  await testEnv.withSecurityRulesDisabled(async (context) => {
    const storage = context.storage();
    const fileRef = ref(storage, 'users/alice/private.txt');
    await uploadBytes(fileRef, encoder.encode('super-secret'));
  });

  const bobContext = testEnv.authenticatedContext('bob');
  const bobStorage = bobContext.storage();
  const aliceFileRef = ref(bobStorage, 'users/alice/private.txt');

  await assertFails(getBytes(aliceFileRef));
});

test('blocks uploads to folders owned by other users', async () => {
  const encoder = new TextEncoder();
  const aliceContext = testEnv.authenticatedContext('alice');
  const aliceStorage = aliceContext.storage();
  const bobFileRef = ref(aliceStorage, 'users/bob/profile.txt');

  await assertFails(uploadBytes(bobFileRef, encoder.encode('nope')));
});
