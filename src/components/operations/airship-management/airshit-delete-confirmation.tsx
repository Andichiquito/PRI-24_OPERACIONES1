import "./airshit-delete-confirmation.css";

type ConfirmationModalProps = {
  show: boolean;
  onClose: () => void;
  onConfirm: () => void;
  message: string;
};

export default function ConfirmationModal({ show, onClose, onConfirm, message }: ConfirmationModalProps) {
  if (!show) {
    return null;
  }

  return (
    <div className="modal">
      <div className="modal-content">
        <div className="modal-message">
          <p>{message}</p>
        </div>
        <div className="modal-buttons">
          <button className="modal-button modal-confirm-button" onClick={onConfirm}>Eliminar</button>
          <button className="modal-button modal-close-button" onClick={onClose}>Cerrar</button>
        </div>
      </div>
    </div>
  );
}