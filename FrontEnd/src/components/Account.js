// import React, { useEffect, useState } from 'react';
//
// const Account = () => {
//     const postAPI = 'http://localhost:8081/api/login';
//     const [accountData, setAccountData] = useState([]);
//
//     useEffect(() => {
//         async function getData() {
//             const response = await fetch(postAPI);
//             const data = await response.json();
//             setAccountData(data);
//         }
//
//         getData();
//     }, []);
//
//     return (
//         <body>
//
//                 <meta charSet="UTF-8"/>
//                     <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
//                         <title>Đăng nhập</title>
//
//             <h2>Đăng nhập</h2>
//             <form action="/login" method="POST">
//                 <div>
//                     <label for="username">Tên tài khoản:</label>
//                     <input type="text" id="username" name="username" required/>
//                 </div>
//                 <div>
//                     <label for="password">Mật khẩu:</label>
//                     <input type="password" id="password" name="password" required/>
//                 </div>
//                 <button type="submit">Đăng nhập</button>
//             </form>
//
//         </body>
//     );
// }
//
// export default Account;