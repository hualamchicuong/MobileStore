import React, {useEffect, useRef, useState} from "react";
import { Link, useParams,useNavigate  } from "react-router-dom";
import "../style/UserInfo.css";
import {useKeycloak} from "@react-keycloak/web";
import { ToastContainer, toast } from 'react-toastify';
import 'react-toastify/dist/ReactToastify.css';
import { AiFillEdit } from 'react-icons/ai';
import {CgAsterisk} from "react-icons/cg";
import {Dropdown, DropdownButton} from "react-bootstrap";


const UserInfo = () =>{
    const { keycloak, initialized } = useKeycloak();
    const [user, setUser] = useState();
    const [newPassword, setNewPassword] = useState('');
    const PasswordInput = useRef(null);
    const navigate = useNavigate();
    let uid = '';
    const AddressinputRef = useRef('');
    const PhoneinputRef = useRef('');
    const [errorAddress, setErrorAddress] = useState('');
    const [errorPhone, setErrorPayment] = useState('');
    const [updateInfo, setupdateInfo] = useState(false);


    const getUserInfo = async ()  =>{
        // eslint-disable-next-line react-hooks/rules-of-hooks
        // Xử lý đăng nhập ở đây
        // console.log(jsonObject);
        if(keycloak.authenticated) {
            console.log(keycloak.tokenParsed);
            uid = keycloak.tokenParsed.sub;
            const res = await fetch(`http://localhost:8081/api/login/${uid}`);
            const data = await res.json();
            setUser(data);

        }
    }

    const updatePhoneNumber = async () =>{
        if(keycloak.authenticated){
            let phone_number = user.phone_number;
            let address = user.address;
            if(PhoneinputRef.current.value !== '') {
                phone_number = PhoneinputRef.current.value;
            }
            if(AddressinputRef.current.value !== ''){
                address = AddressinputRef.current.value;
            }

            let jsonObject = {
                "uid": keycloak.tokenParsed.sub,
                "phone_number": phone_number,
                "address": address
            }
            const res = await fetch(`http://localhost:8081/api/login/updateAddressPhone`, {
                method: "POST",
                headers: {
                    "Content-Type": "application/json",
                },
                body: JSON.stringify(jsonObject)
            })
            navigate(`/userinfo/${user.id}`);
            setupdateInfo(false);
        }
    }

    const handleUpdatePhone_Address = ()=>{
        if(updateInfo){
            setupdateInfo(false);
            console.log(user);
        }
        else{
            setupdateInfo(true);
            console.log(user);

        }

    }

    const handleCancleUpdate = () => {
        setupdateInfo(false);

    }

    const handleKeycloak = () =>{
        keycloak.accountManagement();
    }


    useEffect(() => {
        if (keycloak.authenticated) {
            getUserInfo();
        }
    }, [keycloak.authenticated]);

    useEffect( () => {
        if(user){
            console.log(user);
        }
    },[user,updateInfo])

    return (
        <div className="user-info-container">
            <h1> Thông tin khách hàng </h1>
            {user ? (
                <div className="user-info">
                    <div className="userInfo-OrderConfirm">
                        <h3 className="userinfoTitle name" >Họ và tên:</h3>
                        <h3 className="userinfoTitle username">Username: </h3>
                        <h3 className="userinfoTitle email">Email: </h3>

                    </div>
                    <div className="userValue">
                        <h3 className="name">{user.name}</h3>
                        <h3 className="username">{user.username}</h3>
                        <h3 className="email">{user.email}</h3>

                    </div>
                    {updateInfo ? (
                            <div className="phone-address_Container">
                                <h3>
                                    Số điện thoại<b style={{color: 'red', fontSize: '15px'}}> <CgAsterisk/> </b>:
                                    <input type = "text" className="phoneInput" ref={PhoneinputRef} placeholder={user.phone_number}></input>
                                    {errorPhone && <a style={{ color: 'red' }}>*</a>}
                                </h3>

                                <h3 >
                                    Địa chỉ<b style={{color: 'red', fontSize: '15px'}}> <CgAsterisk/> </b>:
                                    <input type = "text" className="addressInput" ref={AddressinputRef} placeholder={user.address} id="address_id"></input>
                                    {errorAddress && <a style={{ color: 'red' }}>*</a>}
                                </h3>
                                <div className="button-container">
                                    <button onClick={updatePhoneNumber} id="saveUpdate"> Lưu </button>
                                    <button onClick={handleCancleUpdate} id="cancelUpdate">Hủy</button>
                                </div>
                            </div>
                        ) : (
                            <div className="phone-address_Container">
                                <div className="content">
                                    <h3 >
                                        Số điện thoại:
                                        {user.phone_number ? (
                                            <a>  {user.phone_number}   </a>
                                        ) : (
                                            <a style={{color: "red"}}> Chưa cập nhật số điện thoại * </a>
                                        )}
                                    </h3>
                                    <h3 >
                                        Địa chỉ:
                                        {user.address ? (
                                            <a id="address_id">  {user.address}   </a>
                                        ) : (
                                            <a style={{color: "red", marginLeft: "75px"}}> Chưa cập nhật địa chỉ * </a>
                                        )}
                                    </h3>
                                </div>
                                <div className="button-container">
                                    <button onClick={handleUpdatePhone_Address} id="updateAddress_Phone" > Cập nhật số điện thoại/ địa chỉ </button>
                                    <button onClick={handleKeycloak} id="updateBasicInfo"> Cập nhật thông tin cá nhân </button>
                                </div>
                            </div>
                        )}
                </div>
            ) : (
                <>
                    <h1 style={{ fontSize: '40px', textAlign: 'center'}}> Bạn cần đăng nhập để truy cập trang này!. Vui lòng đăng nhập
                        <button
                            style = {{border: 'none',textDecoration: 'underline', color: 'blue', fontSize: '40px', backgroundColor: 'white'}}
                            onClick={() => keycloak.login()}
                        > tại đây </button>

                    </h1>
                </> )}
        </div>

    );
}
export default UserInfo;

