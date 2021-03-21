const db = require("../config/database");


exports.createUser = async (body) => {
    const { email, password, fullname, username, birthdate, state, city } = body;

    const { rows } = await db.query(
      'INSERT INTO public."User" (email, name, username, birthdate) VALUES ($1, $2, $3, $4)',
      [email, fullname, username, birthdate]
    );

    console.log(rows);
};

exports.getUserByEmail = async (email) => {
  // const { email } = req.body;

  const response = await db.query(
    'SELECT * FROM public."User" WHERE email LIKE $1', 
  [email]);
  // res.status(200).send(response.rows);
  return response.rows;
};