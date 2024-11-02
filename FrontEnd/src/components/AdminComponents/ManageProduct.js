import React, {useEffect, useState} from 'react';
import {useNavigate} from 'react-router-dom';
import '../../style/AdminStyle/ManageProduct.css';
import {useKeycloak} from "@react-keycloak/web";
import {ToastContainer} from "react-toastify";
import {IoMdArrowDropdown} from "react-icons/io";
import {Dropdown, DropdownButton} from "react-bootstrap";
import Paging from "../Tools/Paging";


const ManageProduct = (callback, deps)=>{
    const { keycloak, initialized } = useKeycloak();
    const [productData, setProductData] = useState(null);
    const [productShowData, setProductShowData] = useState(null);
    const navigate = useNavigate();
    const [searchTerm, setSearchTerm] = useState('');

    const [showDropdownOptions, setShowDropdownOptions] = useState(false); // State để kiểm soát hiển thị dropdown options
    const [dropDownValue, setDropDownValue] = useState('Tất cả');


    const [currentPage, setCurrentPage] = useState(1);
    const [productsPerPage, setProductsPerPage] = useState(10); // Tùy chỉnh số lượng sản phẩm trên mỗi trang ở đây

    const indexOfLastProduct = currentPage * productsPerPage;
    let totalPages = Math.ceil(productShowData?.length / productsPerPage);
    const pageNumber = [];

    const [updatedCurrentProducts, setUpdatedCurrentProducts] = useState(null); // State mới để lưu trữ currentProducts mới từ Paging

    // Các phần state và useEffect còn lại trong ManageProduct.js
    // ...




    useEffect(() => {

        async function getAllProduct() {
            if(keycloak.authenticated) {
                const response = await fetch(`http://localhost:8081/api/sp/product/list`);
                const data = await response.json();
                setProductData(data);
                setProductShowData(data);
            }
        }
        getAllProduct();
        console.log(productData);

    }, [keycloak.authenticated]);



    const toggleDropdownOptions = () => {
        setShowDropdownOptions(!showDropdownOptions);

    };


    for (let i = 1; i <=totalPages; i++) {
        pageNumber.push(i);
    }

    const handleSearch = (event) => {
        const value = event.target.value;
        setSearchTerm(value);
        // Lọc các phần tử trong mảng dựa trên giá trị nhập vào
    }

    const setStateOrd = (stateValue) =>{
        setDropDownValue(stateValue);
    }
    
    const searchProduct = () => {
        if (searchTerm) {
            const results = searchTerm
                ? productData?.filter((item) =>
                    Object.values(item).some((value) =>
                        value?.toString().toLowerCase().includes(searchTerm.toLowerCase())
                    )
                )
                : [];
            setProductShowData(results);
        } else {
            setProductShowData(productData);
        }
    }


    const filterProduct = () => {
        if (dropDownValue !== "Tất cả") {
            const results = dropDownValue
                ? productData?.filter((item) =>
                    Object.values(item).some((value) =>
                        value?.toString().toLowerCase().includes(dropDownValue.toLowerCase())
                    )
                )
                : [];
            setProductShowData(results);
        } else {
            setProductShowData(productData);
        }
    }


    useEffect(() => {
        filterProduct();
    }, [dropDownValue]);




    // useEffect(() => {
    //     // Update productShowData using filteredProductData here
    //     if(filteredProductData !== productShowData){
    //         setProductShowData(filteredProductData);
    //     }
    // }, [filteredProductData]);



    const handleProductDetail = (productID) => {
        localStorage.setItem('productID',productID)
        navigate(`/productdetailAdminView/${productID}}`);
    }



    const handleUpdateCurrentProducts = (newCurrentProducts) => {
        if(newCurrentProducts){
            setUpdatedCurrentProducts(newCurrentProducts);
        }
    };


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
                        <h1>Danh sách sản phẩm</h1>

                        <div className="search-filter-container">
                            <b className="search-bar-account">
                                <input
                                    type="text"
                                    placeholder="Nhập từ khóa về sản phẩm..."
                                    value={searchTerm}
                                    onChange={handleSearch}
                                    className="search-account"
                                />
                                <button onClick={searchProduct} className="search-account">
                                    Tìm kiếm
                                </button>

                                {/* Hiển thị gợi ý và hình ảnh sản phẩm */}

                            </b>

                            <h3 className="ProductType">
                                Loại sản phẩm:
                                <a className="dropDownContainer" style={{marginTop: "5px"}}>
                                    <DropdownButton
                                        title = {dropDownValue}
                                        className="btn-state-filter"
                                        onClick={toggleDropdownOptions}>
                                        {!!showDropdownOptions && (
                                            <div className="DropdownItem-StateFilter">
                                                <Dropdown.Item className="dropdown-item" onClick={() => setStateOrd('Iphone') }>
                                                    Iphone
                                                </Dropdown.Item>
                                                <Dropdown.Item className="dropdown-item" onClick={() => setStateOrd('Samsung') }>
                                                    Samsung
                                                </Dropdown.Item>
                                                <Dropdown.Item className="dropdown-item" onClick={() => setStateOrd('MacBook') }>
                                                    MacBook
                                                </Dropdown.Item>
                                                <Dropdown.Item className="dropdown-item" onClick={() => setStateOrd('AirPods') }>
                                                    AirPods
                                                </Dropdown.Item>
                                                <Dropdown.Item className="dropdown-item" onClick={() => setStateOrd('Watch') }>
                                                    Watch
                                                </Dropdown.Item>
                                                <Dropdown.Item className="dropdown-item" onClick={() => setStateOrd('iPad') }>
                                                    iPad
                                                </Dropdown.Item>
                                                <Dropdown.Item className="dropdown-item" onClick={() => setStateOrd('Apple TV') }>
                                                    Apple TV
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
                            <div className="title-bar-item id">Mã sản phẩm</div>
                            <div className="title-bar-item productName">Tên sản phẩm</div>
                            <div className="title-bar-item product_Type">Loại sản phẩm</div>
                            <div className="title-bar-item productPrice">Giá sản phẩm</div>
                            <div className="title-bar-item productStock">Số lượng tồn</div>
                        </div>

                        <div className="order-history" >
                            <div className="order-grid" >
                                {Array.isArray(updatedCurrentProducts) ? (
                                    updatedCurrentProducts.map((product, index) => {
                                        return (
                                            <div className="title">
                                                <button className="order-item" onClick={async () => {await handleProductDetail(product.id)}}>
                                                    {/*{checkFilterOrd(product) && (*/}
                                                        <>
                                                            <div id="id_orderInfo" className="item"  >
                                                                <button onClick={async () => {await handleProductDetail(product.id)}} style={{textDecoration:"underline", color: "blue", border: "none", backgroundColor: "white", fontSize: "20px", marginTop: "20px", pointerEvents: "auto", fontWeight: "bold"}} >
                                                                    #{product.id}
                                                                </button>
                                                            </div>

                                                            <div id="username" className="item" >
                                                                <h3>
                                                                    {product.name},{product.color},{product.storage}
                                                                </h3>
                                                            </div>

                                                            <div id="id_orderInfo" className="item">
                                                                <h3>
                                                                    {product.type}
                                                                </h3>
                                                            </div>

                                                            <div id="id_orderInfo" className="item" >
                                                                <h3>
                                                                    {product.price.toLocaleString()}
                                                                </h3>
                                                            </div>

                                                            <div id="id_orderInfo" className="item" style={{marginRight: '10px'}}>
                                                                <h3>
                                                                    {product.quantity}
                                                                </h3>
                                                            </div>
                                                        </>
                                                    {/*// )}*/}
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



                    <Paging data={productShowData} updateCurrentProducts={handleUpdateCurrentProducts}/>


                    {/*<c className="cusTomPagination">*/}
                    {/*    <a className="dropDownContainer" style={{marginTop: "5px"}}>*/}
                    {/*        <DropdownButton*/}
                    {/*            title = {productNumberPageTitle}*/}
                    {/*            className="btn-state-filter"*/}
                    {/*            onClick={toggleDropdownPageOptions}>*/}
                    {/*            {!!showDropdownPageOptions && (*/}
                    {/*                <div className="dropDownPageContainer" >*/}
                    {/*                    <Dropdown.Item className="dropdown-item" onClick={() => setNumberProduct(10) } style={{border: "1px solid black"}}>*/}
                    {/*                        10/Trang*/}
                    {/*                    </Dropdown.Item>*/}
                    {/*                    <Dropdown.Item className="dropdown-item" onClick={() => setNumberProduct(20) } style={{border: "1px solid black"}}>*/}
                    {/*                        20/Trang*/}
                    {/*                    </Dropdown.Item>*/}
                    {/*                    <Dropdown.Item className="dropdown-item" onClick={() => setNumberProduct(50) } style={{border: "1px solid black"}}>*/}
                    {/*                        50/Trang*/}
                    {/*                    </Dropdown.Item>*/}
                    {/*                    <Dropdown.Item className="dropdown-item" onClick={() => setNumberProduct(100) } style={{border: "1px solid black"}}>*/}
                    {/*                        100/Trang*/}
                    {/*                    </Dropdown.Item>*/}
                    {/*                </div>*/}
                    {/*            )}*/}
                    {/*        </DropdownButton>*/}
                    {/*        <IoMdArrowDropdown className="iconFilter"/>*/}


                    {/*    </a>*/}
                    {/*</c>*/}

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
                    {/*                        {number}*/}
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

                    {/*<c className="pagination">*/}
                    {/*    {}*/}
                    {/*    <button onClick={prevPage} disabled={currentPage === 1}>*/}
                    {/*        Trang Trước*/}
                    {/*    </button>*/}
                    {/*    <span>*/}
                    {/*        Trang {currentPage} của {totalPages}*/}
                    {/*    </span>*/}
                    {/*    <button onClick={nextPage} disabled={currentProducts?.length < productsPerPage}>*/}
                    {/*        Trang Tiếp Theo*/}
                    {/*    </button>*/}
                    {/*</c>*/}

                </div>
            ) : (
                <h1 style={{textAlign: "center", marginTop:"20vh", color: "red"}}> Bạn không có quyền truy cập vào trang này** </h1>
            )}
        </>
    );
}

export default ManageProduct;