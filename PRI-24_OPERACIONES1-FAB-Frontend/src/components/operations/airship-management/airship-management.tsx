import { useState } from "react";
import { Link } from "react-router-dom";
import { FaEdit } from "react-icons/fa";
import { MdDelete } from "react-icons/md";
import { IoIosArrowBack } from "react-icons/io";
import { FaPlus } from "react-icons/fa6";
import { CiMenuKebab } from "react-icons/ci";
import ConfirmationModal from "./airshit-delete-confirmation";
import "./airship-management.css";

export default function AirshipManagement() {
    const [showModal, setShowModal] = useState(false);
    const [airshitDelete, setAirshitToDelete] = useState<number | null>(null);

    const aiships = [
        { id: 1, matricula: "FAB-754", model: "AS 350 - B3", serial: "4547", modelomotor:"C-R124", combustible:"120.026   LTS", capacidadpasajero:"5", peso: "1361.0", pesovacio: "1060.0", pesomaximo: "1100.0", horasVuelo:"3", rem:"17:00:00", estado: "P"},
        { id: 2, matricula: "FAB-755", model: "AS 350 - B3", serial: "4547", modelomotor:"C-R124", combustible:"120.026   LTS", capacidadpasajero:"5", peso: "1361.0", pesovacio: "1260.0", pesomaximo: "1100.0", horasVuelo:"3", rem:"17:00:00", estado: "W"},
        { id: 3, matricula: "FAB-756", model: "AS 350 - B3", serial: "4547", modelomotor:"C-R124", combustible:"120.026   LTS", capacidadpasajero:"5", peso: "1361.0", pesovacio: "1260.0", pesomaximo: "1100.0", horasVuelo:"3", rem:"17:00:00", estado: "P"},
        { id: 4, matricula: "FAB-757", model: "AS 350 - B3", serial: "4547", modelomotor:"C-R124", combustible:"120.026   LTS", capacidadpasajero:"5", peso: "1361.0", pesovacio: "1260.0", pesomaximo: "1100.0", horasVuelo:"3", rem:"17:00:00", estado: "P"},
        { id: 5, matricula: "FAB-758", model: "AS 350 - B3", serial: "4547", modelomotor:"C-R124", combustible:"120.026   LTS", capacidadpasajero:"5", peso: "1361.0", pesovacio: "1260.0", pesomaximo: "1100.0", horasVuelo:"3", rem:"17:00:00", estado: "P"},
        { id: 6, matricula: "FAB-759", model: "AS 350 - B3", serial: "4547", modelomotor:"C-R124", combustible:"120.026   LTS", capacidadpasajero:"5", peso: "1361.0", pesovacio: "1260.0", pesomaximo: "1100.0", horasVuelo:"3", rem:"17:00:00", estado: "W"},
        
    ];
    const handleDeleteClick = (id: number) => {
        setAirshitToDelete(id);
        setShowModal(true);
      };
    
      const handleCloseModal = () => {
        setShowModal(false);
        setAirshitToDelete(null);
      };
    
      const handleConfirmDelete = () => {
        // Add your delete logic here
        console.log(`Deleted pilot with id: ${airshitDelete}`);
        handleCloseModal();
      };

    return <>
        <div className="airship-management-container">
            {/* Title */}
            <div>
                <h1>
                    <Link to={"/menu-principal/menu-operaciones"}><IoIosArrowBack className="goback-arrow" /></Link>GESTIÓN AERONAVES
                </h1>
            </div>
            
            {/* Add New Pilot Button */}
            <div className="add-button-container">
                <button>
                    <Link to={"/menu-principal/menu-operaciones/gestion-aereonave/gestion-aereonave-registrar"}><FaPlus className="add-button-icon" /></Link>
                </button>
            </div>
            
            
            <table>
                <thead>
                <tr>
                    <th>MATRÍCULA</th>
                    <th>MODELO</th>
                    <th>SERIAL NR</th>
                    <th>MODELO DEL MOTOR </th>
                    <th>CAPACIDAD DE COMBUSTIBLE </th>
                    <th>CAPACIDAD DE PASAJEROS </th>
                    <th>PESO DEFINIDO</th>
                    <th>PESO MÁXIMO</th>
                    <th>PESO VACÍO</th>
                    <th>HORAS DE VUELO</th>
                    <th>REM</th>
                    <th>ESTADO</th>
                    <th>EDITAR | ELIMINAR</th>
                </tr>
                </thead>
                <tbody>
                {aiships.map((airship) => (
                    <tr key={airship.id}>
                    <td>{airship.matricula}</td>
                    <td>{airship.model}</td>
                    <td>{airship.serial}</td>
                    <td>{airship.modelomotor}</td>
                    <td>{airship.combustible}</td>
                    <td>{airship.capacidadpasajero}</td>
                    <td>{airship.peso} Kg</td>
                    <td>{airship.pesomaximo} Kg</td>
                    <td>{airship.pesovacio} Kg</td>
                    <td>{airship.horasVuelo}</td>
                    <td>{airship.rem}</td>
                    <td>{airship.estado}</td>
                    <td>
                        <Link to={"/menu-principal/menu-operaciones/gestion-aereonave/gestion-aereonave-editar"}><FaEdit className="edit-button"/>           </Link>    
                        <button className="delete-button" onClick={() => handleDeleteClick(airship.id)}><MdDelete /></button>
                    </td>
                    </tr>
                ))}
                </tbody>
            </table>

            <div className="user-info-container">
                <span className="username">USER76234</span>
                <button className="forma">
                    <CiMenuKebab fontSize={24} />
                </button>
                <div className="airship-management-logo">
                    <img width={200} height={150}  src="/FAB.png" alt="FAB" />
                </div>
                
            </div>
            
            
        </div>
        <ConfirmationModal
        show={showModal}
        onClose={handleCloseModal}
        onConfirm={handleConfirmDelete}
        message="¿Está seguro de que desea eliminar el AereoNave?"
      />
    </>
}
