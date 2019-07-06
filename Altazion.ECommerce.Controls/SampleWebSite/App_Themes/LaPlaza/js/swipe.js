var swiper = {

    touchStartX: 0,
    touchEndX: 0,
    minSwipePixels: 30,
    detectionZone: undefined,
    swiperCallback: function() {},

    init: function (detectionZone, callback) {
        swiper.swiperCallback = callback;
        detectionZone.addEventListener('touchstart', function (event) {
            swiper.touchStartX = event.changedTouches[0].screenX;
        }, false);
        detectionZone.addEventListener('touchend', function (event) {
            swiper.touchEndX = event.changedTouches[0].screenX;
            swiper.handleSwipeGesture();
        }, false);
    },

    handleSwipeGesture: function () {
        var direction,moved
        if (swiper.touchEndX <= swiper.touchStartX) {
            moved = swiper.touchStartX - swiper.touchEndX;
            direction = "left";
        }
        if (swiper.touchEndX >= swiper.touchStartX) {
            moved = swiper.touchEndX - swiper.touchStartX;
            direction = "right";
        }
        if (moved > swiper.minSwipePixels && direction !== "undefined") {
            swiper.swipe(direction, moved);
        }
    },

    swipe: function (direction, movedPixels) {
        var ret = {};
        ret.direction = direction;
        ret.movedPixels = movedPixels;
        swiper.swiperCallback(ret);
    }
}


var gestureZone = document.getElementById('imgInstances');
swiper.init(gestureZone, function (e) {
    if (screen.width <= 768) {
        let instanceGuid = $('#imgInstances .img-version-produit[data-e-instance-ref="' + $('#hdnLInstance').val() + '"]').attr("data-e-instance-guid");
        let currentImageDisplayedSelecter = $('#imgInstances .img-version-produit[data-e-instance-guid="' + instanceGuid + '"] div.bloc-img:not(.d-none)');
        let currentImageDisplayed = $(currentImageDisplayedSelecter);
        let instanceImages = $('#imgInstances .img-version-produit[data-e-instance-guid="' + instanceGuid + '"] div.bloc-img');

        $(instanceImages).each(function (index) {
            let nextImageIndex;
            if (index === $(instanceImages).index(currentImageDisplayed)) {
                if (e.direction === "right") {
                    nextImageIndex = index - 1;
                    if (index === 0)
                        nextImageIndex = instanceImages.length - 1;
                }
                else if (e.direction === "left") {
                    nextImageIndex = index + 1;
                    if (index === instanceImages.length - 1)
                        nextImageIndex = 0;
                }

                $(currentImageDisplayed).addClass("d-none d-lg-block");
                currentImageDisplayed = $('#imgInstances .img-version-produit[data-e-instance-guid="' + instanceGuid + '"] div.bloc-img')[nextImageIndex];
                $(currentImageDisplayed).removeClass("d-none d-lg-block");
                return false;
            }
        });
        return false;
    }
})