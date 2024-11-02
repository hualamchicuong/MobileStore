import React, { useEffect, useState } from 'react';
import {Link, useNavigate, useParams} from 'react-router-dom';
import { AiFillCheckCircle, AiOutlineCheckCircle, AiFillPlusCircle, AiFillMinusCircle, AiOutlineDelete } from 'react-icons/ai';
import '../style/Cart.css';
import {useKeycloak} from "@react-keycloak/web";
import {Button} from "react-bootstrap";

const Cart = () => {
    const { keycloak, initialized } = useKeycloak();
    const navigate = useNavigate();
    const { cart_id } = useParams();
    const [cartDetails, setCartDetail] = useState([]);
    const [productData, setProductData] = useState([]);
    const [productSysData, setProductSysData] = useState([]);
    const [checkedItems, setCheckedItems] = useState([]);
    const [isAllChecked, setIsAllChecked] = useState(false);
    const [quantityList, setQuantityList] = useState([]);
    const [totalSum, setTotalSum] = useState(0);
    const [productChecked, setProductChecked] = useState([]);

    useEffect(() => {
        async function getCartDetail() {
            const response = await fetch(`http://localhost:8081/api/cart/detail/${cart_id}`);
            const data = await response.json();
            setCartDetail(data);
        }
        getCartDetail();
    }, [cart_id]);

    useEffect(() => {
        async function getProduct() {
            const response = await fetch(`http://localhost:8081/api/sp/product/list`);
            const data = await response.json();

            const filteredProducts = data.filter((product) =>
                cartDetails.some((cartDetail) => cartDetail.id_product === product.id)
            );

            const productsWithNumber = filteredProducts.map((product) => {
                const cartDetail = cartDetails.find((cartDetail) => cartDetail.id_product === product.id);
                return { ...product, number: cartDetail.number };
            });
            setProductData(productsWithNumber);

            const initialQuantities = productsWithNumber.map((product) => product.number);
            setQuantityList(initialQuantities);
        }
        getProduct();
    }, [cartDetails]);

    useEffect(() => {
        async function getProductSystem() {
            const response = await fetch(`http://localhost:8081/api/sp/product/sys/getAllSys`);
            const data = await response.json();
            setProductSysData(data);
        }
        getProductSystem();
    }, []);

    const getProductId = async () =>{
        let temp = [];
        for(let i=0; i<checkedItems.length;i++){
            if (checkedItems[i]){
                temp.push(productData[i]);
            }
        }
        console.log()
        let cartDetailArray = [];
        for(let i=0; i<temp.length;i++){
            let jsonObject = {
                id_Cart: localStorage.getItem('cartId'),
                id_Product: temp[i].id,
                number: 0,
            };
            const res = await fetch(`http://localhost:8081/api/cart/detail/getCartDetail`, {
                method: 'POST',
                headers: {
                    'Content-Type': 'application/json',
                },
                body: JSON.stringify(jsonObject),
            });
            const result = await res.json();
            console.log(result);
            cartDetailArray.push(result);
        }

        localStorage.setItem('cartDetailIds', JSON.stringify(cartDetailArray));

    }

    useEffect(() => {
        // Set all items to be checked or unchecked based on isAllChecked state
        const newCheckedItems = Array(productData.length).fill(isAllChecked);
        setCheckedItems(newCheckedItems);

    }, [isAllChecked, productData]);

    useEffect(() => {
        // Set all items to be checked or unchecked based on isAllChecked state
        setCheckedItems(checkedItems);
        getProductId();
    }, [checkedItems, productData]);

    const handleToggleCheck = (index, product) => {
        const newCheckedItems = [...checkedItems];
        newCheckedItems[index] = !newCheckedItems[index];

        setCheckedItems(newCheckedItems);

        if (newCheckedItems[index]) {
            let newTotalSum = totalSum + (product.price * product.number);
            setTotalSum(newTotalSum);

        }
        else {
            let newTotalSum = totalSum - (product.price * product.number);
            setTotalSum(newTotalSum);
        }
    };

    const handleToggleAllCheck = () => {
        setIsAllChecked(!isAllChecked);
        let newTotalSum = 0;
        if(!isAllChecked) {
            for (let i = 0; i < productData.length; i++) {
                newTotalSum += productData[i].price * productData[i].number;
            }
            setTotalSum(newTotalSum);

        }
        else{
            setTotalSum(0);
            localStorage.removeItem('cartDetailIds');

        }
    };

    const decreaseProductQuantity = async (index, product, event) => {
        if (quantityList[index] > 1) {
            const newQuantityList = [...quantityList];
            newQuantityList[index] = newQuantityList[index] - 1;
            setQuantityList(newQuantityList);

            let jsonObject = {
                id_Cart: localStorage.getItem('cartId'),
                id_Product: product.id,
                number: newQuantityList[index],
            };
            const res = await fetch(`http://localhost:8081/api/cart/detail/login/getCart`, {
                method: 'POST',
                headers: {
                    'Content-Type': 'application/json',
                },
                body: JSON.stringify(jsonObject),
            });
            const result = await res.json();
            console.log(result);
            //
            if(checkedItems[index]){
                let newTotalSum = totalSum - product.price;
                setTotalSum(newTotalSum);

            }

            // Không cần reload trang, chỉ cần cập nhật lại dữ liệu
            setProductData((prevProductData) =>
                prevProductData.map((product, i) =>
                    i === index ? { ...product, number: newQuantityList[index] } : product
                )
            );

        }
    };

    const deteleteProduct = async(product) =>{
        let jsonObject = {
            id_Cart: localStorage.getItem('cartId'),
            id_Product: product.id,
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
        console.log(result);
        window.location.reload();
    }



    const handleQuantityChange = async (index, product, event) => {
        if (quantityList[index] < product.quantity) {
            const newQuantity = parseInt(event.target.value, 10);
            const newQuantityList = [...quantityList];
            newQuantityList[index] = newQuantity;
            setQuantityList(newQuantityList);
            console.log(newQuantityList);


            let jsonObject = {
                id_Cart: localStorage.getItem('cartId'),
                id_Product: product.id,
                number: newQuantityList[index],
            };


            const res = await fetch(`http://localhost:8081/api/cart/detail/login/getCart`, {
                method: 'POST',
                headers: {
                    'Content-Type': 'application/json',
                },
                body: JSON.stringify(jsonObject),
            });
            const result = await res.json();
            console.log(result);

            if(checkedItems[index]){
                let newTotalSum = totalSum + (totalSum - (product.price * newQuantity)) ;
                setTotalSum(newTotalSum);

            }

            setProductData((prevProductData) =>
                prevProductData.map((product, i) =>
                    i === index ? {...product, number: newQuantityList[index]} : product
                )
            );
        }
    }

    // useEffect(() => {
    //     let newTotalSum = 0;
    //     let checked = localStorage.getItem('cartDetailIds');
    //     for (let i = 0; i < checked.length; i++) {
    //         for (let j = 0; j < productData.length; j++) {
    //             if (checked[i].id === productData[j].id) {
    //                 newTotalSum += productData[j].price * productData[j].number;
    //             }
    //         }
    //
    //     }
    //     console.log(checked);
    //     setTotalSum(newTotalSum);
    // }, [productData, checkedItems]);

    const increaseProductQuantity = async (index, product, event) => {
        if (quantityList[index] < product.quantity) {
            const newQuantityList = [...quantityList];
            newQuantityList[index] = newQuantityList[index] + 1;
            setQuantityList(newQuantityList);

            let jsonObject = {
                id_Cart: localStorage.getItem('cartId'),
                id_Product: product.id,
                number: newQuantityList[index],
            };


            const res = await fetch(`http://localhost:8081/api/cart/detail/login/getCart`, {
                method: 'POST',
                headers: {
                    'Content-Type': 'application/json',
                },
                body: JSON.stringify(jsonObject),
            });
            const result = await res.json();
            console.log(result);

            console.log(checkedItems[index]);
            if(checkedItems[index]){
                let newTotalSum = totalSum + product.price;
                setTotalSum(newTotalSum);

            }

            console.log(checkedItems[index]);


            setProductData((prevProductData) =>
                prevProductData.map((product, i) =>
                    i === index ? { ...product, number: newQuantityList[index] } : product
                )
            );

        }
    };

    const handleOrderClick = () =>{
        navigate(`/order`);
    }




    return (
        <>
            {keycloak.authenticated ? (
                <>
                    <div className={`cart_container`}>
                            <div className="title-product-grid" style={{ width: '90%'}}>
                                <h1 style={{ marginLeft: '18px', fontSize: '35px' }}>Giỏ hàng</h1>

                                <div className="title-bar">
                                    <div
                                        className={`title-bar-item ${isAllChecked ? 'checked' : ''}`}
                                        onClick={handleToggleAllCheck}
                                        style = {{fontSize: "30px"}}
                                    >
                                        {isAllChecked ? <AiFillCheckCircle /> : <AiOutlineCheckCircle />}
                                    </div>
                                    <div className="title-bar-item productInfo">Tên sản phẩm</div>
                                    <div className="title-bar-item productSystemItem">Thông tin sản phẩm</div>
                                    <div className="title-bar-item Quantity">Số lượng</div>
                                    <div className="title-bar-item Price">Đơn giá</div>
                                    <div className="title-bar-item TotalCost">Thành tiền</div>
                                    <div className="title-bar-item Delete">Hành động </div>
                                </div>

                                <div className = {`cart_item_container_Cart`}>
                                    <div className="product-grid">
                                        {Array.isArray(productData) ? (
                                            productData.map((product, index) => {
                                                const productSysList = productSysData.filter(
                                                    (sysProduct) => sysProduct.id_product === product.id
                                                );
                                                return (
                                                    <div className="title">
                                                        <div className="product-item">
                                                            <div
                                                                className={`checkIcon ${
                                                                    checkedItems[index] ? 'checked' : ''
                                                                }`}
                                                                onClick={() => handleToggleCheck(index, product)}
                                                            >
                                                                {checkedItems[index] ? (
                                                                    <AiFillCheckCircle />
                                                                ) : (
                                                                    <AiOutlineCheckCircle />
                                                                )}
                                                            </div>
                                                            <Link
                                                                key={index}
                                                                to={`/product/${product.id}`}
                                                                style={{
                                                                    textDecoration: 'none',
                                                                    pointerEvent: 'none',
                                                                    color: 'black',
                                                                }}
                                                            >
                                                                <div id="id_productInfo" className="productInfo">
                                                                    <h3>
                                                                        {product.name}, {product.color}, {product.storage}
                                                                    </h3>
                                                                    <img src={product.image} alt={product.name} />
                                                                </div>
                                                            </Link>
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

                                                                <div className="Quantity_container">
                                                                    <div
                                                                        className={`decreaseButton ${quantityList[index] <= 1 ? 'disabled' : ''}`}
                                                                        onClick={(event) => decreaseProductQuantity(index, product, event)}
                                                                    >
                                                                        <AiFillMinusCircle />
                                                                    </div>
                                                                    <input
                                                                        type="text"
                                                                        className="quantityInput"
                                                                        value={quantityList[index]}
                                                                        style={{textAlign: 'center' }}
                                                                        onChange={(event) => handleQuantityChange(index,product,event)}
                                                                    />
                                                                    <div
                                                                        className={`increaseButton ${quantityList[index] >= 10 ? 'disabled' : ''}`}
                                                                        onClick={(event) => increaseProductQuantity(index, product, event)}
                                                                    >
                                                                        <AiFillPlusCircle />
                                                                    </div>
                                                                </div>
                                                                <p id="value" className="Price"> {product.price.toLocaleString()}</p>
                                                                <p id="value" className="TotalCost">{(product.number * product.price).toLocaleString()}</p>
                                                                <p id="id_Delete" className="Delete" onClick={(event) => deteleteProduct(product, event)}>
                                                                    <AiOutlineDelete />
                                                                </p>
                                                        </div>
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
                    <div className="SumTotal">
                        Tổng tiền: {totalSum.toLocaleString()} VNĐ
                        <Button className="order" onClick={() => navigate(`/confirmOrder`)}>
                            Đặt hàng
                        </Button>

                    </div>

                </>
                ) : (
                    <h1 style={{ fontSize: '40px', textAlign: 'center'}}> Bạn cần đăng nhập để truy cập trang này!. Vui lòng đăng nhập
                        <button
                            style = {{border: 'none',textDecoration: 'underline', color: 'blue', fontSize: '40px', backgroundColor: 'white'}}
                            onClick={() => keycloak.login()}
                        > tại đây </button>

                    </h1>
                )}
        </>

    );
};

export default Cart;