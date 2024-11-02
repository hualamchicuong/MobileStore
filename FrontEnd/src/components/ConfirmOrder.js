import React, {useEffect, useRef, useState} from 'react';
import {useKeycloak} from "@react-keycloak/web";
import '../style/ConfirmOrder.css';
import {Dropdown, DropdownButton} from "react-bootstrap";
import {Link, useNavigate} from "react-router-dom";
import { ToastContainer, toast } from 'react-toastify';
import 'react-toastify/dist/ReactToastify.css';
import { CgAsterisk } from 'react-icons/cg';


const ConfirmOrder = () => {
    const { keycloak, initialized } = useKeycloak();
    const [productList, setProduct] = useState([]);
    const [user, setUser] = useState(null);
    const [ordDetails, setOrdDetails] = useState([]);
    const [productSysData, setProductSysData] = useState([]);
    const [showDropdownOptions, setShowDropdownOptions] = useState(false); // State để kiểm soát hiển thị dropdown options
    const [dropDownValue, setDropDownValue] = useState('Chọn phương thức thanh toán');
    const navigate = useNavigate();
    const AddressinputRef = useRef(null);
    const NoteinputRef = useRef(null);
    const [errorAddress, setErrorAddress] = useState('');
    const [errorPayment, setErrorPayment] = useState('');
    const [errorPhone, setErrorPhone] = useState('');
    const [tempAddress, setTempAddres] = useState('');

    const [order, setOrder] = useState(null);
    const [ordDetail, setOrdDetail] = useState([]);

    let totalNonVAT = 0;
    let totalVAT = 0;
    const getOrderDetail = () =>{
        var ordDetails = JSON.parse(localStorage.getItem('cartDetailIds'));
        setOrdDetails(ordDetails);
    }

    const getUserInfo = async ()  =>{
        // eslint-disable-next-line react-hooks/rules-of-hooks
        // Xử lý đăng nhập ở đây
        // console.log(jsonObject);
        if(keycloak.authenticated) {
            console.log(keycloak.tokenParsed);
            const uid = keycloak.tokenParsed.sub;
            const res = await fetch(`http://localhost:8081/api/login/${uid}`);
            const data = await res.json();
            setUser(data);
        }
    }

    useEffect(() => {
        if (user) {

            if(!user.phone_number){
                setErrorPhone('* Tài khoản của bạn chưa cập nhật số điện thoại! ');
            }
            if(!user.address){
                setErrorAddress('* Tài khoản của bạn chưa cập nhật địa chỉ! ');
            }
            // else{
            //     setTempAddres(user.address);
            //     AddressinputRef.current = user.address;
            // }
        }
    }, [user]);

    // useEffect(() => {
    //     if (user) {
    //         if(user.address){
    //             AddressinputRef.current = tempAddress;
    //             console.log(AddressinputRef.current.value);
    //         }
    //     }
    // }, [user, tempAddress]);


    // const getProduct = async (product_id) =>{
    //     const response = await fetch(`http://localhost:8081/api/sp/product/${product_id}`);
    //     const data = await response.json();
    //     console.log(data);
    //     return data;
    // }

    const toggleDropdownOptions = () => {
        setShowDropdownOptions(!showDropdownOptions);
    };

    const setPaymentMethod = (paymentValue) =>{
        setDropDownValue(paymentValue);
        localStorage.setItem('paymentmethod', paymentValue);
    }

    useEffect(() => {
        async function getProductSystem() {
            const response = await fetch(`http://localhost:8081/api/sp/product/sys/getAllSys`);
            const data = await response.json();
            setProductSysData(data);
        }


        async function getProduct() {
            const response = await fetch(`http://localhost:8081/api/sp/product/list`);
            const data = await response.json();
            setProduct(data);
        }
        getProduct();
        getProductSystem();
    }, []);

    useEffect(() => {
        if (keycloak.authenticated) {
            getUserInfo();
            getOrderDetail();
        }
    }, [keycloak.authenticated]);


    const getOrderDate = () =>{
        let date = new Date();
        const year = date.toLocaleString('default', {year: 'numeric'});
        const month = date.toLocaleString('default', {month: '2-digit'});
        const day = date.toLocaleString('default', {day: '2-digit'});
        return [year, month, day].join('-');
    }

    const createOrder = async() =>{
        localStorage.removeItem('orderID');
        if(keycloak.authenticated) {
            const temp = keycloak.tokenParsed.sub;
            console.log(temp);
            let orderDate = getOrderDate();
            console.log(orderDate);
            let jsonObject = {
                uid: temp,
                state: "Đã gửi",
                address: AddressinputRef.current.value,
                note: NoteinputRef.current.value,
                totalcost: totalNonVAT,
                totalcostVAT: totalVAT,
                paymentMethod:  dropDownValue,
                orderDate: orderDate,
            };
            const res = await fetch(`http://localhost:8081/api/order/createorder`, {
                method: 'POST',
                headers: {
                    'Content-Type': 'application/json',
                },
                body: JSON.stringify(jsonObject),
            });
            const result = await res.json();
            console.log(result);
            localStorage.removeItem('paymentmethod');
            localStorage.setItem('orderID', result.id);
            setOrder(result);
        }
    }

    const deteleteProduct = async(id) =>{
        let jsonObject = {
            id_Cart: localStorage.getItem('cartId'),
            id_Product: id,
            number: 0,
        };

        const res = await fetch(`http://localhost:8081/api/cart/detail/deleteProduct`, {
            method: 'POST',
            headers: {
                'Content-Type': 'application/json',
            },
            body: JSON.stringify(jsonObject),
        });
        const result = await res.json();
    }


    const InsertOrderDetails = async() => {
        await createOrder();
        var ordDetail = JSON.parse(localStorage.getItem('cartDetailIds'));
        var id_ord = localStorage.getItem('orderID');
        let ordDetailArray = [];

        for (let i = 0; i < ordDetail.length; i++) {
            // console.log(ordDetail[i].id_product);
            console.log(id_ord);
            let jsonObject = {
                id_order: id_ord,
                id_product: ordDetail[i].id_product,
                quantity: ordDetail[i].number,

            };
            const res = await fetch(`http://localhost:8081/api/order/detail/getorderdetail`, {
                method: 'POST',
                headers: {
                    'Content-Type': 'application/json',
                },
                body: JSON.stringify(jsonObject),
            });
            const result = await res.json();
            console.log(result);
            ordDetailArray.push(result);
            await deteleteProduct(ordDetail[i].id_product);

        }
    }





    const checkValidInput = () =>{

        if(!AddressinputRef.current.value && user.address){
            AddressinputRef.current = user.Address;
            InsertOrderDetails();
            toast.success("Gửi yêu cầu đặt hàng thành công!");
        }

        else if(!AddressinputRef.current.value && dropDownValue === 'Chọn phương thức thanh toán'){
            toast.error("Gửi yêu cầu đặt hàng không thành công!");
            setErrorAddress('* Vui lòng nhập địa chỉ.'); // Thiết lập thông báo lỗi
            setErrorPayment('* Vui lòng chọn phương thức thanh toán.');
        }



        else if(!AddressinputRef.current.value){
            toast.error("Gửi yêu cầu đặt hàng không thành công!");
            setErrorAddress('* Vui lòng nhập địa chỉ.'); // Thiết lập thông báo lỗi
            setErrorPayment('');
        }

        else if(dropDownValue === 'Chọn phương thức thanh toán'){
            toast.error("Gửi yêu cầu đặt hàng không thành công!");
            setErrorPayment('* Vui lòng chọn phương thức thanh toán.');
            setErrorAddress('');
        }

        else if(AddressinputRef.current.value && dropDownValue !== 'Chọn phương thức thanh toán') {
            // localStorage.setItem('address', AddressinputRef.current.value);
            // localStorage.setItem('note', NoteinputRef.current.value);
            // localStorage.setItem('totalcost', totalNonVAT);
            setErrorAddress('');
            setErrorPayment('');
            InsertOrderDetails();
            toast.success("Gửi yêu cầu đặt hàng thành công!");
        }



    }


    return(
        <div className="confirm-order-container">
            <h1 style={{fontSize: '35px' }}> Tạo yêu cầu mua hàng </h1>

            <div className="user-info-container-confirmOrder">
                <h2> Thông tin khách hàng </h2>
                {user ? (
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
                            <input type = "text" className="noteInput" ref={NoteinputRef}></input>

                        </div>
                        <div className="payment-address">
                            {errorPayment && <p style={{ color: 'red', position: 'relative'}}>{errorPayment}</p>}
                            <h3 className="PaymentMetod">
                                Phương thức thanh toán<b style={{color: 'red', fontSize: '15px'}}> <CgAsterisk/> </b> :
                                <DropdownButton
                                title = {dropDownValue}
                                className="btn-payment-method"
                                onClick={toggleDropdownOptions}>
                                {!!showDropdownOptions && (
                                    <div className="DropdownItem-PaymentMethod">
                                        <Dropdown.Item className="dropdown-item" onClick={() => setPaymentMethod('Chuyển khoản') }>
                                            Chuyển khoản
                                        </Dropdown.Item>
                                        <Dropdown.Item className="dropdown-item" onClick={() => setPaymentMethod('Tiền mặt') }>
                                            Tiền mặt
                                        </Dropdown.Item>
                                        <Dropdown.Item className="dropdown-item" onClick={() => setPaymentMethod('Khuyến mãi') }>
                                            Khuyến mãi
                                        </Dropdown.Item>

                                    </div>
                                )}

                                </DropdownButton>

                            </h3>
                            <h3 >
                                {errorAddress && <a style={{ color: 'red' }}>{errorAddress}<Link to={`/userinfo/${user.id}`}>Nhấn vào đây để cập nhật</Link><br></br></a>}
                                Địa chỉ<b style={{color: 'red', fontSize: '15px'}}> <CgAsterisk/> </b>:
                                <input type = "text" className="addressInput" ref={AddressinputRef} value={user.address}></input>
                            </h3>


                            <h3 >
                                {errorPhone && <a style={{ color: 'red' }}>{errorPhone}<Link to={`/userinfo/${user.id}`}>Nhấn vào đây để cập nhật</Link><br></br></a>}
                                Số điện thoại<b style={{color: 'red', fontSize: '15px'}}> <CgAsterisk/> </b>:
                                <input type = "text" className="PhoneNumber"  value={user.phone_number} readOnly={true}></input>
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

                        <div className = {`cart_item_container`}>
                            <div className="product-grid">
                                {Array.isArray(ordDetails) ? (
                                    ordDetails.map((order, index) => {
                                        const productSysList = productSysData.filter(
                                            (sysProduct) => sysProduct.id_product === order.id_product
                                        );
                                        const products = productList.filter(
                                            (productL) => productL.id === order.id_product
                                        );
                                        if(Array.isArray(products) && products.length >= 1) {
                                            totalNonVAT = totalNonVAT + (products[0].price * order.number);
                                            totalVAT = totalNonVAT + (totalNonVAT * 0.1);
                                        }
                                        return (
                                            <div className="title">
                                                <div className="product-item">
                                                    <div id="id_productInfo" className="productInfo" >
                                                        {products.map((product,Pindex) =>
                                                            <h3>
                                                                {product.name}, {product.color}, {product.storage}
                                                            </h3>
                                                        )}
                                                    </div>
                                                    <div className="productSystemItem">
                                                        {productSysList.slice(0, 7).map((productSys, sysIndex) => (
                                                            <>
                                                                <text className="product-name-system">
                                                                    {productSys.name} :{' '}
                                                                </text>
                                                                <text
                                                                    dangerouslySetInnerHTML={{ __html: productSys.value }}
                                                                    className="product-value-system"
                                                                />
                                                                <text>, </text>
                                                            </>
                                                        ))}
                                                    </div>

                                                    <div id="quantity-price-total-ConfirmOrder" className="quantity-price-total">
                                                            <p id="valueNumber" className="Quantity">
                                                                <div>{order.number}</div>
                                                            </p>
                                                            {products.map((product,Pindex) =>
                                                                <>
                                                                    <p id="valuePrice" className="Price"> {product.price.toLocaleString()}</p>
                                                                    <p id="valueTotal" className="TotalCost">{(order.number * product.price).toLocaleString()}</p>
                                                                </>
                                                            )}
                                                    </div>
                                                </div>
                                            </div>
                                        );

                                    })
                                ) : (
                                    <p>Loading...</p>
                                )}
                            </div>

                        </div>
                        <div className="totalSum">
                            <p>Tổng tiền(Chưa VAT): {totalNonVAT.toLocaleString()}</p>
                            <p id="vatvalue">Tổng tiền(VAT 10%): {totalVAT.toLocaleString()}</p>
                            <button onClick={checkValidInput}> Đặt hàng </button>
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
                    </div>
                </div>

            </>

        </div>

    );
}

export default ConfirmOrder;