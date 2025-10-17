import { before, after, afterEach, test } from 'node:test';
import { readFile } from 'node:fs/promises';
import assert from 'node:assert';
import {
  initializeTestEnvironment,
  assertFails,
  assertSucceeds,
} from '@firebase/rules-unit-testing';
import { doc, getDoc, setDoc } from 'firebase/firestore';

let testEnv;

before(async () => {
  const rules = await readFile(new URL('../../firestore.rules', import.meta.url), {
    encoding: 'utf8',
  });

  testEnv = await initializeTestEnvironment({
    projectId: 'demo-pencatatan-keuangan',
    firestore: {
      rules,
    },
  });
});

afterEach(async () => {
  if (testEnv) {
    await testEnv.clearFirestore();
  }
});

after(async () => {
  if (testEnv) {
    await testEnv.cleanup();
  }
});

test('allows users to read and write their own profile', async () => {
  const aliceContext = testEnv.authenticatedContext('alice');
  const aliceDb = aliceContext.firestore();
  const aliceProfileRef = doc(aliceDb, 'users/alice');

  await assertSucceeds(
    setDoc(aliceProfileRef, {
      ownerId: 'alice',
      displayName: 'Alice',
    }),
  );

  const profileSnapshot = await assertSucceeds(getDoc(aliceProfileRef));
  assert.equal(profileSnapshot.exists(), true);
  assert.equal(profileSnapshot.data()?.ownerId, 'alice');
});

test('prevents users from accessing other profiles', async () => {
  await testEnv.withSecurityRulesDisabled(async (context) => {
    const db = context.firestore();
    await setDoc(doc(db, 'users/alice'), {
      ownerId: 'alice',
      displayName: 'Alice',
    });
  });

  const bobContext = testEnv.authenticatedContext('bob');
  const bobDb = bobContext.firestore();
  const aliceProfileRef = doc(bobDb, 'users/alice');

  await assertFails(getDoc(aliceProfileRef));
});

test('enforces ownership for nested collections', async () => {
  const aliceContext = testEnv.authenticatedContext('alice');
  const aliceDb = aliceContext.firestore();
  const transactionRef = doc(aliceDb, 'users/alice/transactions/txn123');

  await assertSucceeds(
    setDoc(transactionRef, {
      ownerId: 'alice',
      amount: 125000,
    }),
  );

  const bobContext = testEnv.authenticatedContext('bob');
  const bobDb = bobContext.firestore();
  const bobViewRef = doc(bobDb, 'users/alice/transactions/txn123');

  await assertFails(getDoc(bobViewRef));
});
