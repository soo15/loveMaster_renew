<<<<<<< HEAD
version https://git-lfs.github.com/spec/v1
oid sha256:f612e3d1fbe89d61d19a7fbe9b572da014b88fc67be135debce76add05f0f3f2
size 1292
=======
// Callback Hell example
class UserStorage {
  loginUser(id, password) {
    return new Promise((resolve, reject) => {
      setTimeout(() => {
        if (
          (id === 'ellie' && password === 'dream') ||
          (id === 'coder' && password === 'academy')
        ) {
          resolve(id);
        } else {
          reject(new Error('not found'));
        }
      }, 2000);
    });
  }

  getRoles(user) {
    return new Promise((resolve, reject) => {
      setTimeout(() => {
        if (user === 'ellie') {
          resolve({ name: 'ellie', role: 'admin' });
        } else {
          reject(new Error('no access'));
        }
      }, 1000);
    });
  }

  // Homework Answer 🚀
  async getUserWithRole(user, password) {
    const user = await this.loginUser(user, password);
    const role = await this.getRoles(user);
    return role;
  }
}

// Original code from Youtube course
const userStorage = new UserStorage();
const id = prompt('enter your id');
const password = prompt('enter your passrod');
userStorage
  .loginUser(id, password)
  .then(userStorage.getRoles)
  .then(user => alert(`Hello ${user.name}, you have a ${user.role} role`))
  .catch(console.log);

// Homework Answer 🚀
userStorage
  .getUserWithRole() //
  .catch(console.log)
  .then(console.log);
>>>>>>> b5bcfaee1171b19d6c037cb3e04951c60adec453
