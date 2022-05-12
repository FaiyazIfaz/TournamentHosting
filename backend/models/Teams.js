
var mysql = require('mysql');

var con = mysql.createConnection({
    host: "localhost",
    user: "root",
    password: "",
    database: "map"
  });

module.exports = {

    getTeam: async (id) => {

        return (async () => {
            var sql = `SELECT * FROM teams WHERE id = '${id}'`;
            const result = await findTeam(sql);
            console.log(result);
            return result;
        })();

        function findTeam(sql) {
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

    getAllTeams: async () => {

        return (async () => {
            var sql = `SELECT * FROM teams`;
            const result = await getTeams(sql);
            console.log(result);
            return result;
        })();

        function getTeams(sql) {
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

    getTeamsByCreator: async (id) => {

        return (async () => {
            var sql = `SELECT * FROM teams WHERE creator = '${id}'`;
            const result = await getTeams(sql);
            console.log(result);
            return result;
        })();

        function getTeams(sql) {
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

    addTeam: async (team) => {

        // con.connect(async function (err) {
        //     if (err) throw err;
        //     console.log("Connected!");
        //     var sql = `INSERT INTO teams (name, capacity, description) VALUES ('${team.name}', '${team.capacity}', '${team.description}')`;
        //     con.query(sql, async function (err, result) {
        //       if (err) throw err;
        //       team.id = await result.insertId;
        //     });
        //   });
        
        return (async () => {
            var sql = `INSERT INTO teams (name, capacity, description, creator) VALUES ('${team.name}', '${team.capacity}', '${team.description}', '${team.creator}')`;
            const result = await AddTeam(sql);
            console.log(result);
            team.id = result;
            return team;
        })();

        function AddTeam(sql) {
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

    updateTeam: async (team) => {

        return (async () => {
            console.log(team.id)
          var sql = `UPDATE teams set name = '${team.name}', capacity = '${team.capacity}', description = '${team.description}' WHERE id = '${team.id}'`;
          const result = await UpdateTeam(sql);
          console.log(result);
          return team;
      })();

      function UpdateTeam(sql) {
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

  updateTeamTournament: async (team, tournament) => {

    return (async () => {
    console.log(team)
    console.log(tournament)
      var sql = `UPDATE teams set tournament = '${tournament}' WHERE id = '${team}'`;
      const result = await UpdateUser(sql);
      console.log(result);
      return team;
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

  removeTeamTournament: async (team) => {

    return (async () => {
    console.log(team)
      var sql = `UPDATE teams set tournament = null WHERE id = '${team}'`;
      const result = await UpdateUser(sql);
      console.log(result);
      team.team = null;
      return team;
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

  getTeamsByTournament: async (tournament) => {

    return (async () => {
        var sql = `SELECT * FROM teams WHERE tournament = '${tournament}'`;
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

    getteamsByNoTournament: async () => {

        return (async () => {
            var sql = `SELECT * FROM teams WHERE tournament IS NULL`;
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