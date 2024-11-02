import React, { useEffect, useState } from 'react';
import {Link, useNavigate, useParams} from 'react-router-dom';
import {useKeycloak} from "@react-keycloak/web";
import {ToastContainer} from "react-toastify";
import {IoMdArrowDropdown} from "react-icons/io";
import {Dropdown, DropdownButton} from "react-bootstrap";
import '../../style/AdminStyle/ManageAccount.css'
import UserDetailAdminView from "./UserDetailAdminView";
import Paging from "../Tools/Paging";



const ManageAccount = ()=>{
    const { keycloak, initialized } = useKeycloak();
    const [userData, setUserData] = useState(null);
    const navigate = useNavigate();
    const [searchTerm, setSearchTerm] = useState('');
    const [userShowData, setUserShowData] = useState(null);



    const [updatedCurrentUser, setUpdatedCurrentUser] = useState(null); // State mới để lưu trữ currentProducts mới từ Paging


    const handleSearch = (event) => {
        const value = event.target.value;
        setSearchTerm(value);
        // Lọc các phần tử trong mảng dựa trên giá trị nhập vào
    }

    const searchAccount = () => {
        if (searchTerm) {
            const results = searchTerm
                ? userData?.filter((item) =>
                    Object.values(item).some((value) =>
                        value?.toString().toLowerCase().includes(searchTerm.toLowerCase())
                    )
                )
                : [];
            setUserShowData(results);
        } else {
            setUserShowData(userData);
        }
    }


    const getAllUser = async () =>{
        await fetch(`http://localhost:8081/api/login`, {
            method: 'GET',
            headers: {
                'Content-Type': 'application/json',
            },
        })
            .then( async (res) =>{
                const data = await res.json();
                console.log(data);
                setUserData(data);
                setUserShowData(data);
            })

    }

    useEffect(() => {
        const fetchData = async () => {
            if (keycloak.authenticated) {
                await getAllUser();
            }
        };
        fetchData();

    }, [keycloak.authenticated]);

    // const checkFilterOrd = (order) => {
    //     if(dropDownValue === "Tất cả"){
    //         return true;
    //     }
    //     else{
    //         return dropDownValue === order.state;
    //     }
    // }

    const handleUpdateCurrentUser = (newCurrentUser) => {
        if(newCurrentUser){
            setUpdatedCurrentUser(newCurrentUser);
        }
    };

    const handleAccountDetail = (user) => {
        navigate(`/userdetailAdminView/${user.uid}`);
    }

    return (
        <>
            {localStorage.getItem('checkAdmin') ? (
                <div className="manage_account_container">
                    <ToastContainer
                        position="top-right"
                        autoClose={3000}
                        hideProgressBar={false}
                        newestOnTop={false}
                        closeOnClick
                        rtl={false}
                        pauseOnFocusLoss
                        draggable
                        pauseOnHover
                    />
                    <div className="manange-title">
                        <h1 style={{marginLeft: "20px"}}>Danh sách tài khoản</h1>

                        <div className="search-bar-account">
                                <input
                                    type="text"
                                    placeholder="Nhập từ khóa về khách hàng..."
                                    value={searchTerm}
                                    onChange={handleSearch}
                                    className="search-account"
                                />
                            <button onClick={searchAccount} className="search-account">
                                Tìm kiếm
                            </button>

                            {/* Hiển thị gợi ý và hình ảnh sản phẩm */}

                        </div>
                    </div>
                    <div className="title-bar-container">
                        <div className="title-bar">
                            <div className="title-bar-item id">#ID</div>
                            <div className="title-bar-item username">Username</div>
                            <div className="title-bar-item name">Họ tên</div>
                            <div className="title-bar-item phone">Số điện thoại</div>
                            <div className="title-bar-item email">Email</div>
                        </div>

                        <div className="order-history">
                            <div className="order-grid">
                                {Array.isArray(updatedCurrentUser) ? (
                                    updatedCurrentUser.map((user, index) => {
                                        return (
                                            <div className="title">
                                                <button className="order-item" onClick={async () => {await handleAccountDetail(user)}}>
                                                    <div id="id_orderInfo" className="item"  >
                                                        <button onClick={async () => {await handleAccountDetail(user)}} style={{textDecoration:"underline", color: "blue", border: "none", fontSize: "20px", marginTop: "20px", pointerEvents: "auto", fontWeight: "bold"}} >
                                                            #{user.id}
                                                        </button>
                                                    </div>

                                                    <div id="username" className="item" >
                                                        <h3>
                                                            {user.username}
                                                        </h3>
                                                    </div>

                                                    <div id="id_orderInfo"
                                                         className="item">
                                                        <h3>
                                                            {user.name}
                                                        </h3>
                                                    </div>

                                                    <div id="id_orderInfo" className="item" >

                                                            {user.phone_number ? (
                                                                <>
                                                                <h3> {user.phone_number}</h3>
                                                                </>
                                                            ) : (
                                                                <h3 style={{color: "red"}}>
                                                                    Chưa cập nhật số điện thoại*
                                                                </h3>
                                                            )
                                                            }

                                                    </div>

                                                    <div id="id_orderInfo" className="item" >
                                                        <h3>
                                                            {user.email}
                                                        </h3>
                                                    </div>
                                                </button>

                                            </div>
                                        );

                                    })
                                ) : (
                                    <p>Loading...</p>
                                )}
                            </div>
                        </div>
                    </div>
                    <Paging data={userShowData} updateCurrentProducts={handleUpdateCurrentUser}/>

                </div>
            ) : (
                <h1 style={{textAlign: "center", marginTop:"20vh", color: "red"}}> Bạn không có quyền truy cập vào trang này** </h1>
            )}
        </>
    );

}

export default ManageAccount;