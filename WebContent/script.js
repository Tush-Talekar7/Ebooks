const container = document.getElementById('scrollContainer');
        let scrollPosition = 0;

        function scrollHorizontally(direction) {
            const itemWidth = document.querySelector('.scroll-item').offsetWidth;
            scrollPosition += direction * itemWidth;
            const maxScroll = (container.children.length - 1) * itemWidth;

            // Prevent scrolling beyond the first or last item
            if (scrollPosition < 0) {
                scrollPosition = 0;
            } else if (scrollPosition > maxScroll) {
                scrollPosition = maxScroll;
            }

            container.style.transform = `translateX(-${scrollPosition}px)`;
        }