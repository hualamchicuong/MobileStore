import React, {useEffect, useRef, useState} from 'react';
import {useKeycloak} from "@react-keycloak/web";
import '../style/OrderHistory.css'
import {useNavigate} from "react-router-dom";
import { ToastContainer, toast } from 'react-toastify';
import 'react-toastify/dist/ReactToastify.css';
import {Dropdown, DropdownButton} from "react-bootstrap";
import {IoMdArrowDropdown} from "react-icons/io";


const OrderHistory = () =>{

    const { keycloak, initialized } = useKeycloak();
    const [orderHistory, setOrderHistory] = useState([]);
    const [uid, setUid] = useState('');
    const navigate = useNavigate();
    const [showDropdownOptions, setShowDropdownOptions] = useState(false); // State để kiểm soát hiển thị dropdown options
    const [dropDownValue, setDropDownValue] = useState('Tất cả');

    const getUID = () => {
        setUid(keycloak.tokenParsed.sub);
    }

    useEffect(  () => {
        if (keycloak.authenticated) {
            getUID();
        }
    }, [keycloak.authenticated]);

    useEffect( () => {
        async function getOrderHistory() {
            if(keycloak.authenticated) {
                console.log(uid);
                const response = await fetch(`http://localhost:8081/api/order/${uid}`);
                const data = await response.json();
                console.log(data);
                setOrderHistory(data);
            }
        }
        getOrderHistory();
    },[keycloak.authenticated,uid]);



    const handleOrderDetail = (order) => {
        localStorage.setItem('orderID', order.id);
        localStorage.setItem('uid', order.uid);
        navigate(`/orderDetail`);
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


    return(
        <div className="order_history_container">
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
            <div className="title-bar-container">
                <div className="title-bar">
                    <div className="title-bar-item id">Mã đơn hàng</div>
                    <div className="title-bar-item order_state">Trạng thái</div>
                    <div className="title-bar-item order_date">Ngày đặt</div>
                    <div className="title-bar-item order_payment">Phương thức thanh toán</div>
                    <div className="title-bar-item total_cost">Tổng tiền</div>
                </div>

                <div className="order-history">
                    <div className="order-Admin-grid">
                        {Array.isArray(orderHistory) ? (
                            orderHistory.map((orders, index) => {
                                return (
                                    <div className="title">
                                        <button className="order-item" onClick={async () => {await handleOrderDetail(orders)}}>
                                            {checkFilterOrd(orders) && (
                                                <>
                                                    <div id="id_orderInfo" className="item"  >
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

                                                    <div id="id_orderInfo" className="item" >
                                                        <h3>
                                                            {orders.total_cost_vat}
                                                        </h3>
                                                    </div>
                                                </>
                                            )}
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

        </div>
    );
}

export default OrderHistory;