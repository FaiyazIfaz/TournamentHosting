
var mysql = require('mysql');

var con = mysql.createConnection({
    host: "localhost",
    user: "root",
    password: "",
    database: "map"
  });

  con.connect();
  


module.exports = {
    getUser: async (id) => {
        

        return (async () => {
            var sql = `SELECT * FROM users WHERE id = '${id}'`;
            const result = await findUser(sql);
            console.log(result);
            return result;
        })();

        function findUser(sql) {
            return new Promise((resolve, reject) => {
            con.query(
                sql,
                (err, result) => {
                    console.log(result)
                    return err ? reject(err) : resolve(result);
                }
            );
            });
        }

    },

    login: async (username, password) => {
       

        return (async () => {
            var sql = `SELECT * FROM users WHERE username = '${username}' AND password = '${password}'`;
            const result = await authenticateUser(sql);
            console.log(result);
            if(result[0]) return result;
            return null;
        })();

        function authenticateUser(sql) {
            return new Promise((resolve, reject) => {
            con.query(
                sql,
                (err, result) => {
                    console.log(result)
                    return err ? reject(err) : resolve(result);
                }
            );
            });
        }
    },

    getAllUsers: async () => {
        

        return (async () => {
            var sql = `SELECT * FROM users`;
            const result = await getUsers(sql);
            console.log(result);
            return result;
        })();

        function getUsers(sql) {
            return new Promise((resolve, reject) => {
            con.query(
                sql,
                (err, result) => {
                    return err ? reject(err) : resolve(result);
                }
            );
            });
        }


    },


    addUser: async (user) => {
        
       


        return (async () => {
            var sql = `INSERT INTO users (username, password, email, type) VALUES ('${user.username}', '${user.password}', '${user.email}', '${user.type}')`;
            const result = await AddUser(sql);
            console.log(result);
            user.id = result;
            return user;
        })();

        function AddUser(sql) {
            return new Promise((resolve, reject) => {
            con.query(
                sql,
                (err, result) => {
                    return err ? reject(err) : resolve(result.insertId);
                }
            );
            });
        }


    },

    updateUser: async (user) => {

        return (async () => {
        console.log(user.id)
          var sql = `UPDATE users set username = '${user.username}', password = '${user.password}', email = '${user.email}' WHERE id = '${user.id}'`;
          const result = await UpdateUser(sql);
          console.log(result);
          return user;
      })();

      function UpdateUser(sql) {
          return new Promise((resolve, reject) => {
          con.query(
              sql,
              (err, result) => {
                  return err ? reject(err) : resolve(result);
              }
          );
          });
      }
  },

  updateUserTeam: async (user, team) => {

    return (async () => {
    console.log(user)
    console.log(team)
      var sql = `UPDATE users set team = '${team}' WHERE id = '${user}'`;
      const result = await UpdateUser(sql);
      console.log(result);
      return user;
  })();

  function UpdateUser(sql) {
      return new Promise((resolve, reject) => {
      con.query(
          sql,
          (err, result) => {
              return err ? reject(err) : resolve(result);
          }
      );
      });
    }
  },

  removeUserTeam: async (user) => {

    return (async () => {
    console.log(user)
      var sql = `UPDATE users set team = null WHERE id = '${user}'`;
      const result = await UpdateUser(sql);
      console.log(result);
      user.team = null;
      return user;
  })();

  function UpdateUser(sql) {
      return new Promise((resolve, reject) => {
      con.query(
          sql,
          (err, result) => {
              return err ? reject(err) : resolve(result);
          }
      );
      });
    }
  },

  getUsersByTeam: async (team) => {

    return (async () => {
        var sql = `SELECT * FROM users WHERE team = '${team}'`;
        const result = await getUsers(sql);
        console.log(result);
        return result;
    })();

    function getUsers(sql) {
        return new Promise((resolve, reject) => {
        con.query(
            sql,
            (err, result) => {
                return err ? reject(err) : resolve(result);
            }
        );
        });
    }


    },

    getUsersByNoTeam: async () => {

        return (async () => {
            var sql = `SELECT * FROM users WHERE team IS NULL`;
            const result = await getUsers(sql);
            console.log(result);
            return result;
        })();
    
        function getUsers(sql) {
            return new Promise((resolve, reject) => {
            con.query(
                sql,
                (err, result) => {
                    return err ? reject(err) : resolve(result);
                }
            );
            });
        }
    
    
    },

  


}
