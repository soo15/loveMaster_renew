import styled from "styled-components";

const ModalStyle = styled.div`
  height: 365px;
  width: 650px;
  background-color: #fff;
  position: absolute;
  left: 50%;
  top: 50%;
  transform: translate(-50%, -50%);
  padding: 45px;
  display:block;
  z-index: 1011;
  display: ${props => props.isVisible ? "block" : "none" };
  pointer-events: ${props => props.isVisible ? "auto" : "none" };

  .popup-modal__close {
    position: absolute;
    font-size: 5rem;
    right: -10px;
    top: -10px;
    cursor: pointer;
  }
  
`;

export default function Modal({ isVisible  }){

  // isVisible 이 true 이면 위의 css 를 참고해서 팝업을 실행한다.
  return <ModalStyle isVisible={isVisible}>
    <i 
      className="fa fa-window-close popup-modal__close"

      // 닫기를 눌렀을 때 작동해야 되는 부분
      onClick={ }
    >  
    </i>
    <h1>
      팝업 제목
    </h1>
    <div>
      팝업 내용 123 <br />
      팝업 내용 123 <br />
      팝업 내용 123 <br />
      팝업 내용 123 <br />
      팝업 내용 123
    </div>
  </ModalStyle>
}