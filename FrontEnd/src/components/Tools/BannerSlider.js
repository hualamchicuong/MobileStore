import React, { useEffect, useState } from "react";
import '../../style/ToolsStyle/BannerSlider.css';

const BannerSlider = ({ images }) => {
    const [currentSlide, setCurrentSlide] = useState(0);

    const nextSlide = () => {
        if (images.length > 0) {
            setCurrentSlide((prevSlide) => (prevSlide + 1) % images.length);
        }
    };

    const prevSlide = () => {
        setCurrentSlide((prevSlide) => (prevSlide - 1 + images.length) % images.length);
    };

    useEffect(() => {
        const interval = setInterval(() => {
            nextSlide();
        },5000);

        return () => {
            clearInterval(interval);
        };
    }, [images]);

    const displayedImage = images.length > 0 ? images[currentSlide] : null;

    return (
        <>
            <div className="banner-slider" >
                <button className="banner-slider__prev" onClick={prevSlide} >
                    <i className="banner-slider__prev-icon fas fa-arrow-left" ></i>
                </button>
                <div className="banner-slider__slides" >
                    <div className="banner-slider__slide active">
                        <img className="slider-image" width="90%" height= "700px" src={displayedImage} alt={`Slide ${currentSlide}`} style={{zIndex:"-1"}}/>
                    </div>
                </div>
                <button className="banner-slider__next" onClick={nextSlide}>
                    <i className="banner-slider__next-icon fas fa-arrow-right" ></i>
                </button>
            </div>

        </>
    );
};

export default BannerSlider;