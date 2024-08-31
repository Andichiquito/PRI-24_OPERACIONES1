import React, { useState } from "react";
import { Link } from "react-router-dom";
import { IoIosArrowBack } from "react-icons/io";
import "./pilot-edit.css";
import { CiMenuKebab } from "react-icons/ci";

export default function EditPilotForm() {
    const [formData, setFormData] = useState({
        firstName: "Hugo Fernando", lastName: "Perez", middleName: "Oropeza", birthDate: "1990-08-25", gender: "H", militaryRank: "Teniente", role: "Piloto", registrationNumber: "7263833", identificationNumber: "8274612431", mobileNumber:"74853774",
      });

      const handleChange = (e: React.ChangeEvent<HTMLInputElement | HTMLSelectElement>) => {
        const { name, value } = e.target;
        setFormData({
          ...formData,
          [name]: value,
        });
      };


  return <>
    <div className="edit-pilot-container">
        <div>
            <h1>
                <Link to={"/menu-principal/menu-operaciones/gestion-pilotos"}><IoIosArrowBack className="edit-pilot-goback-arrow" /></Link><b>GESTIÓN PILOTOS</b>
                <span className="small-text"> &gt; Modificar Piloto</span>
            </h1>
        </div>

      {/* Pilot Edition Form */}
      <div className="edit-pilot-form-container">
                    
                    <div className="edit-pilot-content">
                        <div className="edit-pilot-info-section">
                            <div className="edit-pilot-label-input-container">
                                <label className="label-section"><strong>Nombre:</strong></label>
                                <input type="text" name="names" value={formData.firstName} onChange={handleChange}/>
                            </div>
                            
                            <div className="edit-pilot-label-input-container">
                                <label className="label-section"><strong>Apellido Paterno:</strong></label>
                                <input type="text" name="lastName" value={formData.lastName} onChange={handleChange}/>
                            </div>

                            <div className="edit-pilot-label-input-container">
                                <br />
                                <label className="label-section"><strong>Apellido Materno:</strong></label>
                                <input type="text" name="middleName" value={formData.middleName} onChange={handleChange}/>
                            </div>

                            <div className="edit-pilot-label-input-container">
                                <br />
                                <label className="label-section"><strong>Grado:</strong></label>
                                <select name="militaryRank" value={formData.militaryRank} onChange={handleChange}>
                                    <option value="TenienteCoronel">Teniente Coronel</option>
                                    <option value="Capitan">Capitán</option>
                                    <option value="Teniente">Teniente</option>
                                    <option value="Subteniente">Subteniente</option>
                                    <option value="sargento">Sargento</option>
                                </select>
                            </div>
                            <div className="edit-pilot-label-input-container">
                                <br />
                                <label className="label-section"><strong>Función:</strong></label>
                                <select name="role" value={formData.role} onChange={handleChange}>
                                    <option value="Aviador">Aviador</option>
                                    <option value="Coaviador">Coaviador</option>
                                    <option value="Instructor">Instructor de Vuelo</option>
                                </select>
                            </div>
                            <div className="edit-pilot-label-input-container">
                                <br />
                                <label className="label-section"><strong>Número de Registro:</strong></label>
                                <input type="text" name="registrationNumber" value={formData.registrationNumber} onChange={handleChange}/>
                            </div>
                            <div className="edit-pilot-label-input-container">
                                <br />
                                <label className="label-section"><strong>Género:</strong></label>
                                <select name="gender" value={formData.gender} onChange={handleChange}>
                                    <option value="H">Hombre</option>
                                    <option value="M">Mujer</option>
                                </select>
                            </div>
                            <div className="edit-pilot-label-input-container">
                                <br />
                                <label className="label-section"><strong>Número de Identificación:</strong></label>
                                <input type="text" name="identificationNumber" value={formData.identificationNumber} onChange={handleChange}/>
                            </div>
                            <div className="edit-pilot-label-input-container">
                                <br />
                                <label className="label-section"><strong>Fecha de Nacimiento:</strong></label>
                                <input type="date" name="birthDate" value={formData.birthDate} onChange={handleChange}/>
                            </div>
                            <div className="edit-pilot-label-input-container">
                                <br />
                                <label className="label-section"><strong>Celular:</strong></label>
                                <input type="text" name="mobileNumber" value={formData.mobileNumber} onChange={handleChange}/>
                            </div>
                            

                        </div>
                        <br />
                        <div>
                            <button className="edit-pilot-button">Modificar Piloto</button>
                        </div>
                        
                    </div>
                </div>
                <div className="pilot-user-info-container">
                    <span className="username">USER76234</span>
                    <button className="forma">
                        <CiMenuKebab fontSize={24} />
                    </button>
                    <div className="edit-pilot-logo">
                        <img width={200} height={150}  src="/FAB.png" alt="FAB" />
                </div>
            </div>
    </div>
  </>
}

