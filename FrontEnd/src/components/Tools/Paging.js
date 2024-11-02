import React, { useEffect, useState } from "react";
import '../../style/ToolsStyle/Paging.css';
import {Dropdown, DropdownButton} from "react-bootstrap";
import {IoMdArrowDropdown} from "react-icons/io";
import {AiFillBackward, AiFillCaretLeft, AiFillCaretRight, AiFillForward} from "react-icons/ai";

const Paging = ({data, updateCurrentProducts}) =>{

    const [showDropdownPageOptions, setShowDropdownPageOptions] = useState(false); // State để kiểm soát hiển thị dropdown options
    const [currentPage, setCurrentPage] = useState(1);
    const [productsPerPage, setProductsPerPage] = useState(10); // Tùy chỉnh số lượng sản phẩm trên mỗi trang ở đây
    const [productNumberPageTitle, setProductNumberPageTitle] = useState('10/Trang');

    const indexOfLastProduct = currentPage * productsPerPage;
    const indexOfFirstProduct = indexOfLastProduct - productsPerPage;
    let totalPages = Math.ceil(data?.length / productsPerPage);
    const pageNumber = [];
    const [updatedCurrentProducts, setUpdatedCurrentProducts] = useState(null);


    const toggleDropdownPageOptions = () =>{
        setShowDropdownPageOptions(!showDropdownPageOptions);
    }

    const setNumberProduct = (value) =>{
        setProductsPerPage(value);
        totalPages = Math.ceil(data?.length / value);
        let numberpageTitle = value + '/Trang';
        setProductNumberPageTitle(numberpageTitle);
    }

    for (let i = 1; i <=totalPages; i++) {
        pageNumber.push(i);
    }

    const nextPage = () => {
        setCurrentPage((prevPage) => prevPage + 1);

    };

    const prevPage = () => {
        setCurrentPage((prevPage) => prevPage - 1);

    };

    const movePage = (number) =>{
        setCurrentPage(number);


    };

    const moveToEndPage = () =>{
        setCurrentPage(totalPages);

    };

    const moveToFirstPage = () =>{
        setCurrentPage(1);

    }


    useEffect(() => {
        setUpdatedCurrentProducts(data?.slice(indexOfFirstProduct, indexOfLastProduct));
    },[data, indexOfFirstProduct, indexOfLastProduct])

    updateCurrentProducts(updatedCurrentProducts);

    return (
        <>
            <c className="cusTomPagination" >
                <c className="dropDownContainer" style={{marginTop: "5px"}}>
                    <DropdownButton
                        title = {productNumberPageTitle}
                        className="btn-state-filter"
                        onClick={toggleDropdownPageOptions}>
                        {!!showDropdownPageOptions && (
                            <div className="dropDownPageContainer" >
                                <Dropdown.Item className="dropdown-item" onClick={() => setNumberProduct(10) } style={{border: "1px solid black"}}>
                                    10/Trang
                                </Dropdown.Item>
                                <Dropdown.Item className="dropdown-item" onClick={() => setNumberProduct(20) } style={{border: "1px solid black"}}>
                                    20/Trang
                                </Dropdown.Item>
                                <Dropdown.Item className="dropdown-item" onClick={() => setNumberProduct(50) } style={{border: "1px solid black"}}>
                                    50/Trang
                                </Dropdown.Item>
                                <Dropdown.Item className="dropdown-item" onClick={() => setNumberProduct(100) } style={{border: "1px solid black"}}>
                                    100/Trang
                                </Dropdown.Item>
                            </div>
                        )}
                    </DropdownButton>
                    <IoMdArrowDropdown className="iconFilter"/>


                </c>
            </c>

            <c className="pagination">
                <>
                    <button className="moveButton" onClick={ () =>  moveToFirstPage} disabled={currentPage === 1}>
                        <AiFillBackward/>
                    </button>

                    <button className="moveButton" onClick={ () =>  prevPage} disabled={currentPage === 1}>
                        <AiFillCaretLeft/>
                    </button>

                    {pageNumber.map((number) => {
                        return (
                            <button
                                className="page-item"
                                onClick={  () => movePage(number)}
                                style={{backgroundColor: currentPage === number ? "lightgray" : "white" }}>
                                {number}
                            </button>
                        );
                    })}

                    <button className="moveButton" onClick={ () =>  nextPage} disabled={currentPage === totalPages}>
                        <AiFillCaretRight/>
                    </button>

                    <button className="moveButton" onClick={ () =>  moveToEndPage} disabled={currentPage === totalPages}>
                        <AiFillForward/>
                    </button>
                </>
            </c>
        </>
    )

}


export default Paging;