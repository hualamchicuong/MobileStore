import React, { useEffect, useState } from "react";
import { Link, useParams,useNavigate  } from "react-router-dom";
import BannerSlider from "./Tools/BannerSlider";
import { useKeycloak } from "@react-keycloak/web";
import { ToastContainer, toast } from 'react-toastify';
import 'react-toastify/dist/ReactToastify.css';
import { BsCartPlus } from "react-icons/bs";
import {AiFillPlusCircle, AiFillMinusCircle} from 'react-icons/ai';
import "../style/ProductDetail.css";
import button from "bootstrap/js/src/button";

const ProductDetail = () => {
    const { keycloak, initialized } = useKeycloak();
    const navigate = useNavigate();
    const { id } = useParams();
    const [product, setProduct] = useState(null);
    const [productImg, setProductImg] = useState(null);
    const [productSystems, setProductSystems] = useState(null);
    const [productColors, setProductColor] = useState([]);
    const [productStorages, setProductStorage] = useState([]);
    const [quantity, setQuantity] = useState(1);
    const [showMore, setShowMore] = useState(false); // State để theo dõi trạng thái hiển thị
    const [checkColorClicked, setCheckColorClicked] = useState(null);
    const [checkStorageClicked, setCheckStorageClicked] = useState(null);
    const [color, setColor] = useState('');
    const [storage, setStorage] = useState('');

    const sendCartDetailInfo = async (event) => {
        if (keycloak.authenticated) {
            let jsonObject = {
                "id_Cart": localStorage.getItem('cartId'),
                "id_Product": localStorage.getItem('id_Product'),
                "number" : quantity
            }
            const res = await fetch(`http://localhost:8081/api/cart/detail/login/getCart/addFromProductDetail`, {
                method: "POST",
                headers: {
                    "Content-Type": "application/json",
                },
                body: JSON.stringify(jsonObject)
            })
            const result = await res.json();
            console.log(result);
            toast.success("Thêm giỏ hàng thành công!");
        }
        else{
            keycloak.login();
        }
    }

    const increaseQuantity = () => {
        // Kiểm tra giới hạn số lượng (ví dụ: không vượt quá 10)
        if (quantity < 10) {
            setQuantity(quantity + 1);
        }
    };

    const decreaseQuantity = () => {
        // Kiểm tra giới hạn số lượng (ví dụ: không nhỏ hơn 1)
        if (quantity > 1) {
            setQuantity(quantity - 1);
        }
    };

    const handleQuantityChange = (event) => {
        // Lấy giá trị mới từ ô input
        const newQuantity = parseInt(event.target.value, 10);

        // Kiểm tra nếu giá trị mới là một số hợp lệ và không âm
        if (!isNaN(newQuantity) && newQuantity >= 0) {
            // Cập nhật biến quantity với giá trị mới
            setQuantity(newQuantity);
        }
    };

    useEffect(() => {
        async function getProductDetail() {
            const response = await fetch(`http://localhost:8081/api/sp/product/${id}`);
            const data = await response.json();
            setProduct(data);
            localStorage.removeItem('id_Product');
            localStorage.setItem('id_Product',data.id);
        }
        getProductDetail();
    }, [id]);


    useEffect(() => {
        async function getProductImg() {
            const response = await fetch(`http://localhost:8081/api/sp/product/${id}/img`);
            const data = await response.json();
            setProductImg(data);
        }
        getProductImg();
    }, [id]);

    useEffect(() => {
        async function getProductSystem() {
            const response = await fetch(`http://localhost:8081/api/sp/product/${id}/sys`);
            const data = await response.json();

            setProductSystems(data);

        }
        getProductSystem();
    }, [id]);

    useEffect(() => {
        async function getProductColor() {
            if(product){
            const response = await fetch(`http://localhost:8081/api/sp/product/model/${product.name}`);
            const data = await response.json();
            setProductColor(data);
            }
        }
        getProductColor();
    }, [product]);

    useEffect(() => {
        async function getProductStorage() {
            if(product){
                const response = await fetch(`http://localhost:8081/api/sp/product/storage/${product.name}`);
                const data = await response.json();
                setProductStorage(data);
            }
        }
        getProductStorage();
    }, [product]);

    if (!product) {
        return <div>Loading...</div>;
    }

    const toggleShowMore = () => {
        setShowMore(!showMore); // Thay đổi trạng thái hiển thị khi người dùng nhấp vào nút "show more"
    };

    const getColorClicked = (productColor) =>{
        if(!checkColorClicked) {
            setColor(productColor.color);
            setCheckColorClicked(productColor);
        }
        else{
            setCheckColorClicked(null);

        }
    }

    const getStorageClicked = (productStorage) => {
        if(checkStorageClicked === productStorage){
            setCheckStorageClicked(null);
        }
        else{
            setStorage(productStorage.storage);
            setCheckStorageClicked(productStorage);
        }
    }


    const getidProduct = async (event) => {

        let jsonObject = {
            "color": color,
            "storage": storage,
            "name": product.name
        }
        const res = await fetch(`http://localhost:8081/api/sp/product/getIdProduct`, {
            method: "POST",
            headers: {
                "Content-Type": "application/json",
            },
            body: JSON.stringify(jsonObject)
        })
        const result = await res.json();
        console.log(result);
        setCheckStorageClicked(null);
        setCheckColorClicked(null);
        navigate(`/product/${result.id}`);
    }

    if(checkColorClicked && checkStorageClicked){
        getidProduct();
    }

    return (
        <div className= "product_detail">
            <div className="productDetailContainer">
                {product ? (
                    <div className="productBasicInfoContainer">
                        <div className="productName_ImageContainer">
                            <h1>{product.name}, {product.color}, {product.storage}</h1>
                            <img src={product.image} alt={product.name} className="ProductImg" />
                        </div>

                        <div className="productPrice_System">

                            <h2 id="price">{product.price.toLocaleString()} VNĐ</h2>
                            <h2 className = "Color_Title"> Màu sắc </h2>
                            <div className = "Product_Color_Container">
                                {Array.isArray(productColors) ? (
                                    productColors.map((productColor, index) => (
                                            <button  className={`product_option_Color_item ${productColor === checkColorClicked ? "clicked" : ""}`}  onClick={() => getColorClicked(productColor)}>
                                                <img className= "product_option_img" src={productColor.image} alt={productColor.name} />
                                                <h3 className = "product_option_color" style={{ textDecoration: 'none', pointerEvent: 'none', color: 'black' }}>{productColor.color}</h3>
                                            </button>
                                    ))
                                ) : (
                                    <p>Loading...</p>
                                )}

                            </div>


                            <h2 className="Storage_Title">Dung lượng</h2>
                            <div className = "Product_Storage_Container" >
                                {Array.isArray(productStorages) ? (
                                    productStorages.map((productStorage, index) => (
                                        <>
                                        {productStorage.storage !== '' ? (
                                            <button className= {`product_option_Storage_item ${productStorage === checkStorageClicked ? "clicked" : ""}`}  onClick={() => getStorageClicked(productStorage)}>
                                                <h3 className = "product_option_storage" style={{ textDecoration: 'none', pointerEvent: 'none', color: 'black'}}>{productStorage.storage}</h3>
                                            </button>
                                        ) : (
                                            <button  className= {`product_option_Storage_item ${productStorage === checkStorageClicked ? "clicked" : ""}`} style={{border: "none"}}  onClick={() => getStorageClicked(productStorage)} >
                                            </button>
                                        )}
                                        </>
                                    ))
                                ) : (
                                    <p>Loading...</p>
                                )}
                            </div>

                            <div className="quantityContainer">
                                <button className="quantityButton" style={{marginRight: '20px'}} onClick={decreaseQuantity}> <AiFillMinusCircle /></button>
                                <input type={"text"} className="quantityValue" value={quantity} style={{width:"100px", borderRadius: "6px", height: "50px", fontSize: "20px",textAlign: "center" }} onChange={handleQuantityChange}></input>
                                <button className="quantityButton" style={{marginLeft: '20px'}} onClick={increaseQuantity}><AiFillPlusCircle /></button>
                            </div>

                            <div className="addToCartContainer">
                                <button className="AddToCartBtn" onClick={sendCartDetailInfo}> <BsCartPlus style={{fontSize: "60px", marginRight: "5px" }}/> Thêm vào giỏ hàng </button>

                            </div>
                        </div>
                    </div>
                    ) : (
                        <p>Loading...</p>
                )}
                <div className="Banner-Info-Container">
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
                    <div className="banner-system-container">
                        {productImg ? (
                            <>
                                <div className="banner">
                                    <h1>Hình ảnh sản phẩm:</h1>
                                    <BannerSlider images={productImg.map((image) => image.img_path)} />
                                </div>
                            </>
                        ) : (
                            <p>Loading...</p>
                        )}
                        {productSystems ? (
                        <div className="productSystemContainer">
                            <h1>Cấu hình chi tiết</h1>
                            <div className="productSystemInfo">
                                    {productSystems.map((productSys,index) => (
                                        <div key={productSys.id} className={`product-system ${index % 2 === 0 ? "even" : "odd"}`}>
                                            <div className="product-name-system" > {productSys.name} : </div>
                                            <div dangerouslySetInnerHTML={{__html: productSys.value}}  className="product-value-system"/>
                                        </div>

                                    ))}
                            </div>
                        </div>
                        ) : (
                            <p>Loading...</p>
                        )}
                    </div>
                </div>
            </div>
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
};

export default ProductDetail;