import {useEffect, useState} from "react";

const ProductInfo = ({ orderDetail }) => {
    const [product, setProduct] = useState(null);
    const [productSystems, setProductSystems] = useState([]);

    const getProduct = async (product_id) =>{
        const response = await fetch(`http://localhost:8081/api/sp/product/${product_id}`);
        return await response.json();
    }

    const getProductSystems = async  (product_id) =>{
        const response = await fetch(`http://localhost:8081/api/sp/product/${product_id}/sys`);
        return await response.json();
    }

    useEffect(() => {
        const fetchData = async () => {
            const products = await getProduct(orderDetail.id_product);
            setProduct(products); // Assuming there's only one product with the given id
            const systems = await getProductSystems(orderDetail.id_product);
            setProductSystems(systems);
        };
        fetchData();
    }, [orderDetail.id_product]);

    return (
        <div className="title">
            {product && (
                <div className="product-item">
                    <div id="id_productInfo" className="productInfo">
                        <h3>
                            {product.name}, {product.color}, {product.storage}
                        </h3>
                    </div>
                    <div className="productSystemItem">
                        {productSystems.slice(0, 7).map((productSys, sysIndex) => (
                            <>
                                <text className="product-name-system">
                                    {productSys.name} :{' '}
                                </text>
                                <text
                                    dangerouslySetInnerHTML={{ __html: productSys.value }}
                                    className="product-value-system"
                                />
                                <text>,</text>
                            </>
                        ))}
                    </div>
                    <div id="quantity-price-total-ConfirmOrder" className="quantity-price-total">
                        <p id="valueNumber" className="Quantity">
                            <div>{orderDetail.quantity}</div>
                        </p>
                        {product ? (
                            <>
                                <p id="valuePrice" className="Price"> {product.price.toLocaleString()}</p>
                                <p id="valueTotal" className="TotalCost">{(orderDetail.quantity * product.price).toLocaleString()}</p>
                            </>
                        ) : (
                            <p>Loading...</p>
                        )}
                    </div>
                </div>
            )}
        </div>
    );
};

export default ProductInfo;