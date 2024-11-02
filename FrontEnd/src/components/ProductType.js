import React, { useEffect, useState } from "react";
import {Link, useParams} from "react-router-dom";
import BannerSlider from "./Tools/BannerSlider";
import "../style/ProductType.css"
import Paging from "./Tools/Paging";

const ProductType = () => {
    const [productData, setProductData] = useState([]);
    const [productImgData, setProductImgData] = useState([]);
    const [productSys, setProductSys] = useState([]);
    const { type } = useParams();

    const [productShowData, setProductShowData] = useState(null);
    const [updatedCurrentProducts, setUpdatedCurrentProducts] = useState(null); // State mới để lưu trữ currentProducts mới từ Paging
    const [currentPage, setCurrentPage] = useState(1);
    const [productsPerPage, setProductsPerPage] = useState(10); // Tùy chỉnh số lượng sản phẩm trên mỗi trang ở đây


    useEffect(() => {
        async function getProduct() {
            const response = await fetch(`http://localhost:8081/api/sp/product/type/${type}`);
            const data = await response.json();
            const groupedProducts = groupBy(data, 'name');

            const uniqueProducts = Object.values(groupedProducts).map(group => group[0]);

            setProductData(uniqueProducts);
            setProductShowData(uniqueProducts);
        }

        async function getProductImg(){
            const response = await fetch(`http://localhost:8081/api/sp/product/img/${type}`);
            const data = await response.json();
            setProductImgData(data);

        }
        getProduct();
        getProductImg();
    }, [type]);

    const containerStyle = {
        display: 'flex',
        flexDirection: 'column',
        textAlign: 'center'

    };


    const getProductSys = async(product_id) =>{
        const response = await fetch(`http://localhost:8081/api/sp/product/${product_id}/sys`);
        const data = await response.json();
        let temp = [];
        for(let i=0;i<data.length;i++){
            if(data[i].name === 'Model' || data[i].name === 'Kích thước' || data[i].name === 'Độ phân giải' || data[i].name === 'Hệ điều hành' || data[i].name === 'Trọng lượng'){
                temp.push(data[i]);
            }
        }

        setProductSys(temp);
    }


    function groupBy(array, property) {
        return array.reduce((result, item) => {
            const key = item[property];
            if (!result[key]) {
                result[key] = [];
            }
            result[key].push(item);
            return result;
        }, {});
    }

    const handleUpdateCurrentProducts = (newCurrentProducts) => {
        if(newCurrentProducts){
            setUpdatedCurrentProducts(newCurrentProducts);
        }
    };


    return (
        <div style={containerStyle}>
            <h1 style={{fontSize: "50px", position: "relative", backgroundColor:"#e0e0e0", width: "100vw", padding:"5px", fontFamily:"Time New Roman", zIndex:"-1"}}>{type}</h1>
            <BannerSlider images={productImgData.map((image) => image.img_path)} />
            <h2 id="productName"></h2>
            <div className="productType-Container">
                {Array.isArray(updatedCurrentProducts) ? (
                    updatedCurrentProducts.map((product, index) => (
                        <Link key={index} to={`/product/${product.id}`} style={{textDecoration:"none"}} className="product-type" onMouseEnter={() => getProductSys(product.id)}>
                                <img width={"350px"} height={"auto"} src={product.image} alt={product.name} />
                                <h3 >{product.name}</h3>
                                <div className="product-Sysinfo">
                                    {Array.isArray(productSys) ? (
                                        productSys.map((productSystem, index) => (
                                        <>
                                            <b>{productSystem.name}</b>: {productSystem.value},
                                        </>
                                        ))
                                    ) : (
                                        <h1> Loading... </h1>
                                    )}

                                </div>
                        </Link>
                    ))
                ) : (
                    <p>Loading...</p>
                )}
            </div>
            <div style={{marginTop: '50px'}}>
                <Paging data={productShowData} updateCurrentProducts={handleUpdateCurrentProducts}/>
            </div>

        </div>
    );
}

export default ProductType;






