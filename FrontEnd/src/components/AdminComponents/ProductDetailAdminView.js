import React, {useEffect, useRef, useState} from 'react';
import {Link, useNavigate, useParams} from 'react-router-dom';
import {useKeycloak} from "@react-keycloak/web";
import {toast, ToastContainer} from "react-toastify";
import {IoMdArrowDropdown} from "react-icons/io";
import {Dropdown, DropdownButton} from "react-bootstrap";
import '../../style/AdminStyle/ManageAccount.css';

import '../../style/AdminStyle/ProductDetailAdminView.css';

import {CgAsterisk} from "react-icons/cg";
import BannerSlider from "../Tools/BannerSlider";
import button from "bootstrap/js/src/button";
import Popup from "reactjs-popup";


const ProductDetailAdminView = () =>{
    const productID = localStorage.getItem('productID')
    const [product, setProduct] = useState(null);
    const [productSystems, setProductSystems] = useState([]);
    const [productImg, setProductImg] = useState(null);
    const [updateInfo, setupdateInfo] = useState(false);
    const [updateSystem, setUpdateSystem] = useState(false);
    const [showMore, setShowMore] = useState(false); // State để theo dõi trạng thái hiển thị
    const [productSystemUpdate, setProductSystemUpdate] = useState([]);
    const NameinputRef = useRef('');
    const PriceinputRef = useRef('');
    const QuantityinputRef = useRef('');
    const ColorinputRef = useRef('');
    const StorageinputRef = useRef('');
    const TypeinputRef = useRef('');
    const ImageinputRef = useRef('');
    const navigate = useNavigate();

    const getProduct = async (product_id) =>{
        const response = await fetch(`http://localhost:8081/api/sp/product/${product_id}`);
        return await response.json();
    }

    const getProductSystems = async  (product_id) =>{
        const response = await fetch(`http://localhost:8081/api/sp/product/${product_id}/sys`);
        return await response.json();
    }

    const getProductImg = async(product_id) =>{
        const response = await fetch(`http://localhost:8081/api/sp/product/${product_id}/img`);
        return await response.json();
    }


    useEffect(() => {
        const fetchData = async () => {
            const products = await getProduct(productID);
            setProduct(products); // Assuming there's only one product with the given id
            const systems = await getProductSystems(productID);
            setProductSystems(systems);
            const images = await getProductImg(productID);
            setProductImg(images);
        };
        fetchData();
    }, [productID]);


    const handleUpdateBasicInfo = ()=>{
        if(updateInfo){
            setupdateInfo(false);
        }
        else{
            setupdateInfo(true);
        }
    }

    const handleUpdateSystem = ()=>{
        if(updateSystem){
            setUpdateSystem(false);
        }
        else{
            setUpdateSystem(true);
        }
    }

    const handleCancleUpdate = () => {
        setupdateInfo(false);

    }

    const handleSaveUpdateSystem = async (productSystem) =>{
        let systemName = productSystem.name;
        let systemValue = productSystem.value;


        let jsonObject = {
            "id": productSystem.id,
            "id_product": productSystem.id_product,
            "name": systemName,
            "value": systemValue,

        }
        const res = await fetch(`http://localhost:8081/api/sp/product/updateProductSystem`, {
            method: "POST",
            headers: {
                "Content-Type": "application/json",
            },
            body: JSON.stringify(jsonObject)
        })
        const data = await res.json();
        console.log(data);

    }

    const ExecuteSaveUpdate =  async () =>{
        if(productSystemUpdate.length > 0){
            for(let i=0;i<productSystemUpdate.length;i++){
                await handleSaveUpdateSystem(productSystemUpdate[i]);
            }
            toast.success('Update thông tin cấu hình thành công!');
        }
        setUpdateSystem(false);
    }

    const handleCancleUpdateSystem = () =>{
        setUpdateSystem(false);

    }

    const getProductSystemNameUpdate = (productSys,index) =>{
        let tempArray = productSystemUpdate;
        let nameInput = '';
        if(document.getElementById(index).value){
            nameInput = document.getElementById(index).value;
        }
        for (let i = 0; i < tempArray.length; i++) {
            if (productSys === tempArray[i]) {
                if (nameInput !== tempArray[i].name && nameInput !== '') {
                    tempArray[i].name = nameInput;
                    setProductSystemUpdate(tempArray);
                    return;
                } else if (nameInput === '') {
                    tempArray.splice(i, 1);
                    setProductSystemUpdate(tempArray);
                    return;
                } else {
                    return;
                }
            }
        }

        productSys.name = nameInput;
        tempArray.push(productSys);
        setProductSystemUpdate(tempArray);
    }

    const getProductSystemValueUpdate = (productSys,index) =>{
        let tempArray = productSystemUpdate;
        let valueInput = '';
        console.log(index);
        if(document.getElementById(index).value){
            valueInput = document.getElementById(index).value;
        }
        if(productSystemUpdate.length > 0) {
            for (let i = 0; i < tempArray.length; i++) {
                if (productSys === tempArray[i]) {
                    if (valueInput !== tempArray[i].value && valueInput !== '') {
                        tempArray[i].value = valueInput;
                        setProductSystemUpdate(tempArray);
                        return;
                    } else if (valueInput === '') {
                        tempArray.splice(i, 1);
                        setProductSystemUpdate(tempArray);
                        return;
                    } else {
                        return;
                    }
                }
            }
        }
        productSys.value = valueInput;
        tempArray.push(productSys);
        setProductSystemUpdate(tempArray);
    }



    const handleSaveUpdate =  async ()=>{
            let productName = product.name;
            let productPrice = product.price;
            let productStorage = product.storage;
            let productColor = product.color;
            let productQuantity = product.quantity;
            let productType = product.type;
            let productImage = product.image

            if(NameinputRef.current.value !== '') {
                productName = NameinputRef.current.value;
            }
            if(PriceinputRef.current.value !== ''){
                productPrice = PriceinputRef.current.value;
            }

            if(StorageinputRef.current.value !== ''){
                productStorage = ColorinputRef.current.value;
            }

            if(ColorinputRef.current.value !== ''){
                productColor = ColorinputRef.current.value;
            }

            if(QuantityinputRef.current.value !== ''){
                productQuantity = QuantityinputRef.current.value;
            }

            if(TypeinputRef.current.value !== ''){
                productType = TypeinputRef.current.value;
            }

            if(ImageinputRef.current.value !== ''){
                productImage = ImageinputRef.current.value;
            }

            let jsonObject = {
                "id": product.id,
                "name": productName,
                "price": productPrice,
                "storage": productStorage,
                "color": productColor,
                "quantity": productQuantity,
                "type": productType,
                "drop": product.drop,
                "image": productImage,
                "description": product.description
            }
            const res = await fetch(`http://localhost:8081/api/sp/product/updateProductInfo`, {
                method: "POST",
                headers: {
                    "Content-Type": "application/json",
                },
                body: JSON.stringify(jsonObject)
            })
            toast.success('Update thông tin điện thoại thành công!');
            setupdateInfo(false);
    }

    const toggleShowMore = () => {
        setShowMore(!showMore); // Thay đổi trạng thái hiển thị khi người dùng nhấp vào nút "show more"
    };



    return (
        <>
            {localStorage.getItem('checkAdmin') ? (
                <>
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
                    {product && (
                        <>
                            <h1 style={{marginLeft: "150px"}}> {product.name},{product.color},{product.storage} </h1>

                            <div className="user-info-container">
                                <div style={{display: "flex", justifyContent: "space-between", direction: "row"}}>
                                    <h2>Thông tin cơ bản</h2>
                                    {!updateInfo ? (
                                         <button onClick={handleUpdateBasicInfo} id="updateProductInfo" className="product-button-container"> Cập nhật thông tin sản phẩm </button>
                                    ) : (
                                        <div>
                                            <button className="product-button-container" onClick={handleSaveUpdate}  id="saveProductUpdate"> Lưu </button>
                                            <button className="product-button-container" onClick={handleCancleUpdate} id="cancelProductUpdate">Hủy</button>
                                        </div>
                                    )}
                                </div>
                                <div className="product-info">


                                    <div className="product_info_Container">

                                        <div className="Title-Info">
                                            <h3 className="productinfoTitle productID">Mã sản phẩm: </h3>

                                            <h3>
                                                Tên sản phẩm:
                                            </h3>

                                            <h3 >
                                                Giá sản phẩm
                                            </h3>
                                            <h3 >
                                                Dung lượng:
                                            </h3>

                                            <h3 >
                                                Màu sắc:
                                            </h3>

                                            <h3 >
                                                Số lượng tồn:
                                            </h3>

                                            <h3 >
                                                Loại:
                                            </h3>
                                        </div>


                                        <div className="Value-Info">
                                            <input type = "text" className="valueInput" placeholder={"#" + product.id} readOnly={true} style={{ backgroundColor: "#dddddd"}}></input>
                                            <input type = "text" className="valueInput" ref={NameinputRef} placeholder={product.name} readOnly={!updateInfo} style={{ backgroundColor: updateInfo  ? "white" : "#dddddd"}}></input>
                                            <input type = "text" className="valueInput" ref={PriceinputRef} placeholder={product.price}  readOnly={!updateInfo} style={{ backgroundColor: updateInfo  ? "white" : "#dddddd"}}></input>
                                            <input type = "text" className="valueInput" ref={StorageinputRef} placeholder={product.storage}  readOnly={!updateInfo} style={{ backgroundColor: updateInfo  ? "white" : "#dddddd"}}></input>
                                            <input type = "text" className="valueInput" ref={ColorinputRef} placeholder={product.color}  readOnly={!updateInfo} style={{ backgroundColor: updateInfo  ? "white" : "#dddddd"}}></input>
                                            <input type = "text" className="valueInput" ref={QuantityinputRef} placeholder={product.quantity}  readOnly={!updateInfo} style={{ backgroundColor: updateInfo  ? "white" : "#dddddd"}}></input>
                                            <input type = "text" className="valueInput" ref={TypeinputRef} placeholder={product.type}  readOnly={!updateInfo} style={{ backgroundColor: updateInfo  ? "white" : "#dddddd"}}></input>
                                        </div>


                                        <div className ="main-image">
                                            <img width={"400px"} src={product.image}/>
                                            <h3 >
                                                Link ảnh: <input type = "text" className="imgInput" ref={ImageinputRef} placeholder={product.image}  readOnly={!updateInfo} style={{ backgroundColor: updateInfo  ? "white" : "#dddddd"}}></input>
                                            </h3>
                                        </div>


                                    </div>
                                </div>
                            </div>

                            <div className= "user-info-container">

                                <div style={{display: "flex", justifyContent: "space-between", direction: "row"}}>
                                    <h2>Thông tin chi tiết</h2>

                                </div>
                                <div className="banner-system-container">

                                    {productSystems ? (
                                        <>
                                            {updateSystem ? (
                                                <div className="productSystemContainer">
                                                    <h3>Cấu hình chi tiết</h3>

                                                    <div className="productSystemInfo">
                                                        {productSystems.map((productSys,index) => (
                                                            <div key={productSys.id} className={`product-system ${index % 2 === 0 ? "even" : "odd"}`}>
                                                                <input
                                                                    onChange={ () =>  {
                                                                        let tempIndex = "name" + index;
                                                                        getProductSystemNameUpdate(productSys, tempIndex)}}
                                                                    type = "text" className="valueInput"  placeholder={productSys.name} readOnly={!updateSystem} style={{ backgroundColor: updateSystem  ? "white" : "#dddddd", width: "100%"}} id={"name" + index}></input>


                                                                <input
                                                                    onChange={ () => {
                                                                        let tempIndex = "value" + index;
                                                                        getProductSystemValueUpdate(productSys, tempIndex)}}
                                                                    type = "text" className="valueInput"  placeholder={productSys.value} readOnly={!updateSystem} style={{ backgroundColor: updateSystem  ? "white" : "#dddddd", marginLeft: "100px", width: "100%"}} id={"value" + index} ></input>
                                                            </div>

                                                        ))}
                                                    </div>
                                                </div>

                                            ) : (

                                                <div className="productSystemContainer">
                                                    <h3>Cấu hình chi tiết</h3>
                                                    <div className="productSystemInfo">
                                                        {productSystems.map((productSys,index) => (
                                                            <div key={productSys.id} className={`product-system ${index % 2 === 0 ? "even" : "odd"}`}>

                                                                <div className="product-name-system" > {productSys.name} : </div>
                                                                <div dangerouslySetInnerHTML={{__html: productSys.value}}  className="product-value-system"/>
                                                            </div>

                                                        ))}
                                                    </div>
                                                </div>

                                            )}
                                        </>
                                    ) : (
                                        <p>Loading...</p>
                                    )}

                                    {updateSystem ? (
                                        <div style={{position:"relative", left:"60%", marginTop:"50px", marginBottom:"50px"}}>
                                            <button className="product-button-container" onClick={ExecuteSaveUpdate}  id="saveProductUpdate"> Lưu </button>
                                            <button className="product-button-container" onClick={handleCancleUpdateSystem}  id="cancelProductUpdate"> Hủy</button>

                                        </div>
                                    ) : (
                                        <button style={{position:"relative", left:"60%", marginTop:"50px", marginBottom:"50px"}} onClick={handleUpdateSystem} id="updateProductInfo" className="product-button-container"> Cập nhật cấu hình sản phẩm</button>
                                    )}

                                    {productImg ? (
                                        <>
                                            <div className="banner">
                                                <h3>Hình ảnh sản phẩm:</h3>

                                                <div className="productImg">

                                                </div>
                                                <BannerSlider images={productImg.map((image) => image.img_path)} />
                                            </div>
                                        </>
                                    ) : (
                                        <p>Loading...</p>
                                    )}



                                    {product ? (
                                        <div className="productInfoContainer">
                                            <h1>Thông số kỹ thuật</h1>
                                            {/* Sử dụng nội dung được cắt giảm dựa trên trạng thái hiển thị */}
                                            <div
                                                className={`description ${showMore ? "expanded" : ""}`}
                                                dangerouslySetInnerHTML={{
                                                    __html: showMore
                                                        ? product.description
                                                        : product.description.slice(0, 750) + "..."
                                                }}
                                            />
                                            {/* Hiển thị nút "show more" chỉ khi nội dung được cắt giảm */}
                                            {!showMore && (
                                                <button onClick={toggleShowMore} className="showMoreButton">
                                                    Show more
                                                </button>
                                            )}
                                            {/* Hiển thị nút "show less" chỉ khi nội dung đã được mở rộng */}
                                            {showMore && (
                                                <button onClick={toggleShowMore} className="showLessButton">
                                                    Show less
                                                </button>
                                            )}
                                        </div>
                                    ) : (
                                        <p>Loading...</p>
                                    )}


                                </div>
                            </div>
                        </>
                    )}
                </>
                ) : (
                    <h1 style={{textAlign: "center", marginTop:"20vh", color: "red"}}> Bạn không có quyền truy cập vào trang này** </h1>
                )}
            </>


            );

}

export default ProductDetailAdminView;
