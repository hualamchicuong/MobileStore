import React, {useEffect, useState} from 'react';
import {useKeycloak} from "@react-keycloak/web";
import 'react-toastify/dist/ReactToastify.css';
import '../style/OrderDetail.css'
import {CgAsterisk} from "react-icons/cg";
import ProductInfo from "./Tools/ProductInfo";
import { ToastContainer, toast } from 'react-toastify';
import 'react-toastify/dist/ReactToastify.css';
import {useNavigate} from "react-router-dom";



const OrderDetail = () => {
    const {keycloak, initialized} = useKeycloak();
    const [orderDetails, setOrderDetail] = useState([]);
    const [order, setOrder] = useState(null);
    const [user, setUser] = useState(null);
    const navigate = useNavigate();

    // let orderid = localStorage.getItem()

    const handleCancleOrder = async () => {
        if (keycloak.authenticated) {
            const response = await fetch(`http://localhost:8081/api/order/cancelOrder/${localStorage.getItem('orderID')}`);
            const data = await response.json();
            const responseOrdDetail = await fetch(`http://localhost:8081/api/order/cancelOrderDetail/${localStorage.getItem('orderID')}`)
            const dataOrdDetail = await responseOrdDetail.json();
            if(data === true){
                toast.success("Hủy đơn thành công ");
                navigate(`/orderHistory`)
            }
            else{
                toast.error("Hủy đơn không thành công, vui lòng tải lại trang");
            }


        }
    }

    const handleConfirmOrder = async () => {
        if (keycloak.authenticated) {
            const response = await fetch(`http://localhost:8081/api/order/confirmOrder/${localStorage.getItem('orderID')}`);
            const data = await response.json();
            if(data === true){
                toast.success("Xác nhận đơn thành công ");
                window.location.reload();
            }
            else{
                toast.error("Xác nhận đơn không thành công, vui lòng tải lại trang");
            }
        }
    }

    const handleCompleteOrder = async () => {
        if (keycloak.authenticated) {
            const response = await fetch(`http://localhost:8081/api/order/completeOrder/${localStorage.getItem('orderID')}`);
            const data = await response.json();
            if(data === true){
                toast.success("Hoàn thành đơn hàng! ");
                window.location.reload();
            }
            else{
                toast.error("Cập nhật trạng thái thất bại");
            }
        }
    }

    const getUserInfo = async () => {
        if (keycloak.authenticated) {
            const response = await fetch(`http://localhost:8081/api/login/${localStorage.getItem('uid')}`);
            const data = await response.json();
            setUser(data);
        }
    }

    const getOrderHistory = async () =>  {
        if (keycloak.authenticated) {
            const response = await fetch(`http://localhost:8081/api/order/detail/${localStorage.getItem('orderID')}`);
            const data = await response.json();
            setOrderDetail(data);
        }
    }

    const getOrder = async () =>  {
        if (keycloak.authenticated) {
            const response = await fetch(`http://localhost:8081/api/order/getorder/${localStorage.getItem('orderID')}`);
            const data = await response.json();
            setOrder(data);
        }
    }


    useEffect(() => {
        if (keycloak.authenticated) {
            const fetchData = async () => {
                await getUserInfo();
                await getOrderHistory();
                await getOrder();

            };
            fetchData();
        }
    }, [keycloak.authenticated]);


    return(

        <div className="confirm-order-container">
            {order ?
                (
                    <h1 style={{fontSize: '35px' }}> Yêu cầu mua hàng #{order.id} </h1>
                ) : (
                    <h2>Loading...</h2>
                )}

            <div className="user-info-container-confirmOrder">
                <h2> Thông tin khách hàng </h2>
                {user && order ? (
                    <div className="user-info">
                        <div className="userInfo-OrderConfirm">
                            <h3 className="userinfoTitle name" >Họ và tên:</h3>
                            <h3 className="userinfoTitle username">Username: </h3>
                            <h3 className="userinfoTitle email">Email: </h3>
                            <h3 className="userinfoTitle noteInput" style={{marginTop: '40px'}}>
                                Ghi chú:
                            </h3>
                        </div>
                        <div className="userinfoValue">
                            <h3 className="name">{user.name}</h3>
                            <h3 className="username">{user.username}</h3>
                            <h3 className="email">{user.email}</h3>
                            <input type = "text" className="noteInput" value={order.note} readOnly={true} style={{backgroundColor: "#DCDCDC"}}></input>

                        </div>
                        <div className="payment-address">
                            <h3 className="PaymentMetod">
                                Phương thức thanh toán<b style={{color: 'red', fontSize: '15px'}} > <CgAsterisk/> </b> :
                                <input type = "text" className="addressInput" value={order.payment_method} readOnly={true} style={{marginLeft: "20px", backgroundColor: "#DCDCDC"}} ></input>
                            </h3>
                            <h3 >
                                Địa chỉ<b style={{color: 'red', fontSize: '15px'}}> <CgAsterisk/> </b>:
                                <input type = "text" className="addressInput" value={order.address} readOnly={true} style={{marginLeft: "155px", backgroundColor: "#DCDCDC"}}></input>
                            </h3>

                            <h3 >
                                Số điện thoại<b style={{color: 'red', fontSize: '15px'}}> <CgAsterisk/> </b>:
                                <input type = "text" className="PhoneNumber" value={user.phone_number} readOnly={true} style={{marginLeft: "100px", backgroundColor: "#DCDCDC"}}></input>
                            </h3>

                        </div>
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
            <>
                <div className={`cart_container-OrderConfirm`}>

                    <h1 style={{fontSize: '35px' }}>Chi tiết đơn hàng</h1>
                    <div className="title" style={{ width: '90%'}}>
                        <div className="title-bar">
                            <div className="title-bar-item productInfo">Tên sản phẩm</div>
                            <div className="title-bar-item productSystemItem">Thông tin sản phẩm</div>
                            <div className="title-bar-item Quantity">Số lượng</div>
                            <div className="title-bar-item Price">Đơn giá</div>
                            <div className="title-bar-item TotalCost">Thành tiền</div>
                        </div>



                        <div className={`cart_item_container`}>
                            <div className="product-grid">
                                {orderDetails && orderDetails.length > 0 ? (
                                    <>{orderDetails.map((orderDetail, index) => (
                                        <ProductInfo key={index} orderDetail={orderDetail} />
                                    ))}</>
                                ) : (
                                    <p>Loading...</p>
                                )}
                            </div>
                        </div>


                        <div className="totalSum">
                            {order ? (
                                <>
                                    <p>Tổng tiền(Chưa VAT): {order.total_cost.toLocaleString()}</p>
                                    <p id="vatvalue">Tổng tiền(VAT 10%): {order.total_cost_vat.toLocaleString()}</p>
                                    <b className="button-container">
                                        {order.state === "Đã gửi" ? (
                                            <>
                                                {keycloak.tokenParsed.resource_access.React.roles[1] === "Admin" && (
                                                    <>
                                                        <button style={{backgroundColor: "#0062cc"}} onClick={handleConfirmOrder}> Đang xử lý </button>
                                                    </>
                                                )}
                                                <button style={{backgroundColor: "red"}} onClick={handleCancleOrder}> Hủy đơn </button>

                                            </>
                                            ) : (
                                                <>
                                                    {order.state === "Đang xử lý" ? (
                                                            <>
                                                                {keycloak.tokenParsed.resource_access.React.roles[1] === "Admin" && (
                                                                    <>
                                                                        <button style={{backgroundColor: "#0062cc"}} onClick={handleCompleteOrder}> Hoàn thành </button>

                                                                        <button style={{backgroundColor: "red"}} onClick={handleCancleOrder}> Hủy đơn </button>

                                                                    </>
                                                                )}
                                                            </>

                                                        ) : (
                                                            <div>

                                                            </div>

                                                    )}
                                                </>
                                        )}
                                    </b>
                               </>
                                ) :(
                                    <>
                                        Loading...
                                    </>
                                ) }
                        </div>
                    </div>
                </div>

            </>
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
        </div>

    );

}

export default OrderDetail;