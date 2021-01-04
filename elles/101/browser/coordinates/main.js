const width = document.querySelector('.line_width');
const height = document.querySelector('.line_height');
const target = document.querySelector('.target');
const tag = document.querySelector('.tag');



addEventListener('load', () => {
    const targetRect = target.getBoundingClientRect();
    const targetHalfWidth = targetRect.width / 2;
    const targetHalfHeight = targetRect.height / 2;



    document.addEventListener('mousemove', (event)=> {
        const cX = event.clientX;
        const cY = event.clientY;
        
        // console.log(cX);
        // console.log(cY);

        width.style.transform = `translateY(${cY}px)`;
        height.style.transform = `translateX(${cX}px)`;
        target.style.transform = `translate(${cX - targetHalfWidth}px, ${cY - targetHalfHeight}px)`;
        tag.style.transform = `translate(${cX + 20}px, ${cY + 20}px)`;
        // width.style.top=`${cY}px`;
        // height.style.left=`${cX}px`;
        // target.style.top=`${cY}px`;
        // target.style.left=`${cX}px`;
        // tag.style.top=`${cY}px`;
        // tag.style.left=`${cX}px`;
        tag.innerHTML=`${cX}px ${cY}px`

    });

})