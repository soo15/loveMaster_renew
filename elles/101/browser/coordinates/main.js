const width = document.querySelector('.line_width');
const height = document.querySelector('.line_height');
const target = document.querySelector('.target');
const tag = document.querySelector('.tag');


document.addEventListener('mousemove', (event)=> {
    const cX = event.clientX;
    const cY = event.clientY;
    
    console.log(cX);
    console.log(cY);

    width.style.top=`${cY}px`;
    height.style.left=`${cX}px`;
    target.style.top=`${cY}px`;
    target.style.left=`${cX}px`;
    tag.style.top=`${cY}px`;
    tag.style.left=`${cX}px`;
    tag.innerHTML=`${cX}px ${cY}px`

})


