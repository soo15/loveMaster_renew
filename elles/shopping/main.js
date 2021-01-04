//plain
// 1.사용자가 텍스트인풋에서 텍스트를 추가할수있다.
// 2.아이템 추가하는 방법 2가지(1.사용자가 +버튼 클릭, 2엔터키를 치거나)
// 3.쓰레기통 버튼 딜리트


const items = document.querySelector('.items');
const input = document.querySelector('.footer__input');
const addBtn = document.querySelector('.footer__button');


function onAdd(){
    // 1.사용자가 입력한 텍스트 받아옴
    const text = input.value;
    if(text === ''){
        input.focus();
        return;
    }
    // 2.새로운 아이템을 만듬(텍스트 +  삭제 버튼)
    const item = createItem();
    // 3. items 컨테이너안에 새로 만든 아이템을 추가한다.
    items.appendChild(item);
    //4.새로 추가된 아이템을 스크롤링
    item.scrollIntoView({block:'center'})
    // 5. 인풋을 초기화 한다.
    input.value = '';
    input.focus();
}

function createItem(text){
    const itemRow = document.createElement('li');
    itemRow.setAttribute('class','item__row');

    const item = document.createElement('div');
    item.setAttribute('class', 'item');

    const name =  document.createElement('span');
    name.setAttribute('class', 'item__name');
    name.innerText = text;

    const deleteBtn = document.createElement('button');
    deleteBtn.setAttribute('class', 'item__delete');
    deleteBtn.innerHTML = '<i class="fas fa-trash-alt"></i>';
    deleteBtn.addEventListener('click', ()=> {
        items.removeChild(itemRow);
    })


    const itemDivider = document.createElement('div');
    itemDivider.setAttribute('class', 'item__divider');

    item.appendChild(name);
    item.appendChild(deleteBtn);

    itemRow.appendChild(item);
    itemRow.appendChild(itemDivider);

    return itemRow;

}
addBtn.addEventListener('click', ()=> {
    onAdd();
})


input.addEventListener('keypress', event => {
    if (event.key === 'Enter'){
        onAdd();
    }
});
