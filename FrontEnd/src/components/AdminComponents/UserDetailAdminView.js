import React, {useEffect, useRef, useState} from "react";
import { Link, useParams,useNavigate  } from "react-router-dom";
import "../../style/UserInfo.css";
import "../../style/AdminStyle/UserDetailAdminView.css";

import {useKeycloak} from "@react-keycloak/web";
import { ToastContainer, toast } from 'react-toastify';
import 'react-toastify/dist/ReactToastify.css';
import { AiFillEdit } from 'react-icons/ai';
import {CgAsterisk} from "react-icons/cg";
import {Dropdown, DropdownButton} from "react-bootstrap";
import {IoMdArrowDropdown} from "react-icons/io";



const UserDetailAdminView = () =>{
    const { keycloak, initialized } = useKeycloak();
    const [user, setUser] = useState();
    const [newPassword, setNewPassword] = useState('');
    const PasswordInput = useRef(null);
    const navigate = useNavigate();
    const AddressinputRef = useRef('');
    const PhoneinputRef = useRef('');
    const [errorAddress, setErrorAddress] = useState('');
    const [errorPhone, setErrorPayment] = useState('');
    const [updateInfo, setupdateInfo] = useState(false);

    const [showDropdownOptions, setShowDropdownOptions] = useState(false); // State để kiểm soát hiển thị dropdown options
    const [dropDownValue, setDropDownValue] = useState('Tất cả');
    const [orderHistory, setOrderHistory] = useState([]);



    const { uid } = useParams();

    useEffect( () => {
        async function getOrderHistory() {
            if(keycloak.authenticated) {
                const response = await fetch(`http://localhost:8081/api/order/${uid}`);
                const data = await response.json();
                console.log(data);
                setOrderHistory(data);
            }
        }

        async function getUserInfo() {
            if(keycloak.authenticated) {
                const res = await fetch(`http://localhost:8081/api/login/${uid}`);
                const data = await res.json();
                setUser(data);
            }
        }
        getUserInfo();
        getOrderHistory();
    },[keycloak.authenticated]);

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
                "uid": uid,
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
            navigate(`/userdetailAdminView/${uid}`);
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






    const toggleDropdownOptions = () => {
        setShowDropdownOptions(!showDropdownOptions);
    };

    const setStateOrd = (stateValue) =>{
        setDropDownValue(stateValue);
    }

    const checkFilterOrd = (order) => {
        if(dropDownValue === "Tất cả"){
            return true;
        }
        else{
            return dropDownValue === order.state;
        }
    }

    const handleOrderDetail = (order) => {
        localStorage.setItem('orderID', order.id);
        localStorage.setItem('uid', order.uid);
        navigate(`/orderDetail`);
    }


    return (
        <>
            {localStorage.getItem('checkAdmin') ? (
                <>
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

                    <div className="order_history_Admin_container">

                        <div className="manange-title">
                            <h1>Lịch sử yêu cầu mua hàng</h1>

                            <h3 className="OrderState">
                                Trạng thái:
                                <a className="dropDownContainer">
                                    <DropdownButton
                                        title = {dropDownValue}
                                        className="btn-state-filter"
                                        onClick={toggleDropdownOptions}>
                                        {!!showDropdownOptions && (
                                            <div className="DropdownItem-StateFilter">
                                                <Dropdown.Item className="dropdown-item" onClick={() => setStateOrd('Đã gửi') }>
                                                    Đã gửi
                                                </Dropdown.Item>
                                                <Dropdown.Item className="dropdown-item" onClick={() => setStateOrd('Đang xử lý') }>
                                                    Đang xử lý
                                                </Dropdown.Item>
                                                <Dropdown.Item className="dropdown-item" onClick={() => setStateOrd('Hoàn thành') }>
                                                    Hoàn thành
                                                </Dropdown.Item>
                                                <Dropdown.Item className="dropdown-item" onClick={() => setStateOrd('Đã hủy') }>
                                                    Đã hủy
                                                </Dropdown.Item>
                                                <Dropdown.Item className="dropdown-item" onClick={() => setStateOrd('Tất cả') }>
                                                    Tất cả
                                                </Dropdown.Item>
                                            </div>
                                        )}
                                    </DropdownButton>
                                    <IoMdArrowDropdown className="iconFilter"/>


                                </a>

                            </h3>
                        </div>
                        <div className="title-bar-Admin-container">
                            <div className="title-bar">
                                <div className="title-bar-item id">Mã đơn hàng</div>
                                <div className="title-bar-item order_state">Trạng thái</div>
                                <div className="title-bar-item order_date">Ngày đặt</div>
                                <div className="title-bar-item order_payment">Phương thức thanh toán</div>
                                <div className="title-bar-item total_cost">Tổng tiền</div>
                            </div>

                            <div className="order-Admin-history">
                                <div className="order-Admin-grid">
                                    {Array.isArray(orderHistory) ? (
                                        orderHistory.map((orders, index) => {
                                            return (
                                                <div className="title">
                                                    <div className="order-item-Admin">
                                                        {checkFilterOrd(orders) && (
                                                            <>
                                                                <div id="id_orderInfo_id" className="item"  >
                                                                    <button onClick={async () => {await handleOrderDetail(orders)}} style={{textDecoration:"underline", color: "blue", border: "none", backgroundColor: "white", fontSize: "20px", marginTop: "20px", pointerEvents: "auto", fontWeight: "bold"}} >
                                                                        #{orders.id}
                                                                    </button>
                                                                </div>

                                                                <div id="id_orderInfo"
                                                                     className="item"
                                                                     style={{backgroundColor: orders.state === "Đã hủy"  ? "red" : orders.state === "Hoàn thành" ? "#009933" : orders.state === "Đang xử lý" ? "#4682B4" : "#FFCC00"
                                                                         ,borderRadius:"15px", height:"10px", alignItems: "center", display:"flex", fontWeight: "normal", textAlign: "center", justifyContent: "center", width: "100px", marginTop: "25px", fontSize: "15px", color: "white"}}>
                                                                    <h3>
                                                                        {orders.state}
                                                                    </h3>
                                                                </div>

                                                                <div id="id_orderInfo" className="item" >
                                                                    <h3>
                                                                        {orders.order_date.slice(0,10)}
                                                                    </h3>
                                                                </div>

                                                                <div id="id_orderInfo" className="item" >
                                                                    <h3>
                                                                        {orders.payment_method}
                                                                    </h3>
                                                                </div>

                                                                <div id="id_orderInfo_totalCost" className="item" >
                                                                    <h3>
                                                                        {orders.total_cost_vat.toLocaleString()}
                                                                    </h3>
                                                                </div>
                                                            </>
                                                        )}
                                                    </div>
                                                </div>
                                            );

                                        })
                                    ) : (
                                        <p>Loading...</p>
                                    )}
                                </div>
                            </div>

                        </div>

                        </div>
                    </>
                ) : (
                <h1 style={{textAlign: "center", marginTop:"20vh", color: "red"}}> Bạn không có quyền truy cập vào trang này** </h1>
                )}
            </>
    );
}


export default UserDetailAdminView;

