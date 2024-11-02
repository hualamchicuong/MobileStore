import React, { useEffect, useState } from 'react';
import {Link, useNavigate, useParams} from 'react-router-dom';
import '../../style/AdminStyle/ManageOrderRequest.css';
import {useKeycloak} from "@react-keycloak/web";
import {ToastContainer} from "react-toastify";
import {IoMdArrowDropdown} from "react-icons/io";
import {Dropdown, DropdownButton} from "react-bootstrap";
import {AiFillBackward, AiFillCaretLeft, AiFillCaretRight, AiFillForward} from "react-icons/ai";
import Paging from "../Tools/Paging";


const ManageOrderRequest = ()=>{
    const { keycloak, initialized } = useKeycloak();
    const [orderData, setOrderData] = useState(null);
    const [userData, setUserData] = useState(null);
    const [orderShowData, setOrderShowData] = useState(null);
    const [checkAdmin, setCheckAdmin] = useState(null);
    const navigate = useNavigate();

    const [showDropdownOptions, setShowDropdownOptions] = useState(false); // State để kiểm soát hiển thị dropdown options
    const [dropDownValue, setDropDownValue] = useState('Tất cả');

    const [searchTerm, setSearchTerm] = useState('');


    // PAGING
    const [showDropdownPageOptions, setShowDropdownPageOptions] = useState(false); // State để kiểm soát hiển thị dropdown options
    const [currentPage, setCurrentPage] = useState(1);
    const [productsPerPage, setProductsPerPage] = useState(10); // Tùy chỉnh số lượng sản phẩm trên mỗi trang ở đây
    const [productNumberPageTitle, setProductNumberPageTitle] = useState('10/Trang');

    const indexOfLastProduct = currentPage * productsPerPage;
    const indexOfFirstProduct = indexOfLastProduct - productsPerPage;
    const currentOrders = orderData?.slice(indexOfFirstProduct, indexOfLastProduct);
    let totalPages = Math.ceil(orderData?.length / productsPerPage);
    const pageNumber = [];

    const [updatedCurrentOrder, setUpdatedCurrentOrder] = useState(null); // State mới để lưu trữ currentProducts mới từ Paging


    const AdminChecker = ()=>{
        for(let i=0;i<keycloak.tokenParsed.resource_access.React.roles.length;i++){
            if(keycloak.tokenParsed.resource_access.React.roles[i] === "Admin"){
                return true;
            }
        }
        return false;
    }

    const getAllOrder = async ()=>{
        await fetch(`http://localhost:8081/api/order/getAll`, {
            method: 'GET',
            headers: {
                'Content-Type': 'application/json',
            },
        })
            .then(async (res) =>{
            const data = await res.json();
            setOrderData(data);
            setOrderShowData(data);
        })

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

        })

    }

    const toggleDropdownOptions = () => {
        setShowDropdownOptions(!showDropdownOptions);
    };

    const setStateOrd = (stateValue) =>{
        setDropDownValue(stateValue);
    }


    useEffect(() => {

        const fetchData = async () => {
            if (keycloak.authenticated) {
                await getAllOrder();
                await getAllUser();

            }
        };

        fetchData();

    }, [keycloak.authenticated]);


    useEffect(() => {
            if (orderData && userData) {
                const updatedOrderData = orderData.map(order => {
                    const user = userData.find(user => user.id === order.id_user);
                    if (user) {
                        return {...order, username: user.username};
                    }
                    return order;
                });
                setOrderData(updatedOrderData);
                setOrderShowData(updatedOrderData);
            }
    },[userData]);

    const filterProduct = () => {
        if (dropDownValue !== "Tất cả") {
            const results = dropDownValue
                ? orderData?.filter((item) =>
                    Object.values(item).some((value) =>
                        value?.toString().toLowerCase().includes(dropDownValue.toLowerCase())
                    )
                )
                : [];
            setOrderShowData(results);
        } else {
            setOrderShowData(orderData);
        }
    }


    useEffect(() => {
        filterProduct();
    }, [dropDownValue]);



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

    //SEARCH *************************************************

    const handleSearch = (event) => {
        const value = event.target.value;
        setSearchTerm(value);
        // Lọc các phần tử trong mảng dựa trên giá trị nhập vào
    }

    const searchOrder = () => {
        if (searchTerm) {
            const results = searchTerm
                ? orderData?.filter((item) =>
                    Object.values(item).some((value) =>
                        value?.toString().toLowerCase().includes(searchTerm.toLowerCase())
                    )
                )
                : [];
            setOrderShowData(results);
        } else {
            setOrderShowData(orderData);
        }
    }

    //PAGING ************************************************


    const handleUpdateCurrentOrder = (newCurrentOder) => {
        if(newCurrentOder){
            setUpdatedCurrentOrder(newCurrentOder);
        }
    };

    //*********************************************************

    return (
        <>
            {localStorage.getItem('checkAdmin') ? (
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
                        <h1>Yêu cầu mua hàng</h1>

                        <div className="search-filter-container">
                            <b className="search-bar-account">
                                <input
                                    type="text"
                                    placeholder="Nhập từ khóa về đơn hàng..."
                                    value={searchTerm}
                                    onChange={handleSearch}
                                    className="search-account"
                                />
                                <button onClick={searchOrder} className="search-account">
                                    Tìm kiếm
                                </button>

                                {/* Hiển thị gợi ý và hình ảnh sản phẩm */}

                            </b>

                            <h3 className="ProductType">
                                Trạng thái:
                                <a className="dropDownContainer" style={{marginTop: "5px"}}>
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
                    </div>
                    <div className="title-bar-container">
                        <div className="title-bar">
                            <div className="title-bar-item id">Mã đơn hàng</div>
                            <div className="title-bar-item username">Tên khách hàng</div>
                            <div className="title-bar-item order_state">Trạng thái</div>
                            <div className="title-bar-item order_date">Ngày tạo</div>
                            <div className="title-bar-item order_payment">Phương thức thanh toán</div>
                            <div className="title-bar-item total_cost">Tổng tiền</div>

                        </div>

                        <div className="order-history">
                            <div className="order-grid">
                                {Array.isArray(updatedCurrentOrder) ? (
                                    updatedCurrentOrder.map((orders, index) => {
                                        return (
                                            <div className="title">
                                                <button className="order-item" onClick={async () => {await handleOrderDetail(orders)}}>
                                                        <>
                                                            <div id="id_orderInfo" className="item"  >
                                                                <button onClick={async () => {await handleOrderDetail(orders)}} style={{textDecoration:"underline", color: "blue", border: "none", backgroundColor: "white", fontSize: "20px", marginTop: "20px", pointerEvents: "auto", fontWeight: "bold"}} >
                                                                    #{orders.id}
                                                                </button>
                                                            </div>

                                                            <div id="username" className="item" >
                                                                <h3>
                                                                    {orders.username}
                                                                </h3>
                                                            </div>

                                                            <div id="id_orderInfo"
                                                                 className="item"
                                                                 style={{backgroundColor: orders.state === "Đã hủy"  ? "red" : orders.state === "Hoàn thành" ? "#009933" : orders.state === "Đang xử lý" ? "#4682B4" : "#FFCC00"
                                                                     ,borderRadius:"15px", height:"10px", alignItems: "center", display:"flex", fontWeight: "normal", textAlign: "center", justifyContent: "center", width: "100px", marginTop: "25px", fontSize: "15px", color: "white", marginLeft: '5px'}}>
                                                                <h3>
                                                                    {orders.state}
                                                                </h3>
                                                            </div>

                                                            <div id="id_orderInfo" className="item" >
                                                                <h3>
                                                                    {orders.order_date.slice(0,10)}
                                                                </h3>
                                                            </div>

                                                            <div id="id_orderInfo" className="item" style={{marginRight: '10px'}}>
                                                                <h3>
                                                                    {orders.payment_method}
                                                                </h3>
                                                            </div>

                                                            <div id="id_orderInfo" className="item" style={{marginRight: '-5px'}} >
                                                                <h3>
                                                                    {orders.total_cost_vat.toLocaleString()}
                                                                </h3>
                                                            </div>
                                                        </>
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

                    <Paging data={orderShowData} updateCurrentProducts={handleUpdateCurrentOrder}/>


                    {/*<c className="pagination">*/}
                    {/*    <>*/}
                    {/*        <button className="moveButton" onClick={moveToFirstPage} disabled={currentPage === 1}>*/}
                    {/*            <AiFillBackward/>*/}
                    {/*        </button>*/}

                    {/*        <button className="moveButton" onClick={prevPage} disabled={currentPage === 1}>*/}
                    {/*            <AiFillCaretLeft/>*/}
                    {/*        </button>*/}

                    {/*        {pageNumber.map((number) => {*/}
                    {/*            return (*/}
                    {/*                <button*/}
                    {/*                    className="page-item"*/}
                    {/*                    onClick={() => movePage(number)}*/}
                    {/*                    style={{backgroundColor: currentPage === number ? "lightgray" : "white" }}>*/}
                    {/*                    {number}*/}
                    {/*                </button>*/}
                    {/*            );*/}
                    {/*        })}*/}

                    {/*        <button className="moveButton" onClick={nextPage} disabled={currentPage === totalPages}>*/}
                    {/*            <AiFillCaretRight/>*/}
                    {/*        </button>*/}

                    {/*        <button className="moveButton" onClick={moveToEndPage} disabled={currentPage === totalPages}>*/}
                    {/*            <AiFillForward/>*/}
                    {/*        </button>*/}
                    {/*    </>*/}
                    {/*</c>*/}

                </div>
            ) : (
                 <h1 style={{textAlign: "center", marginTop:"20vh", color: "red"}}> Bạn không có quyền truy cập vào trang này** </h1>
                )}
        </>
    );
}

export default ManageOrderRequest;