import React, { useState } from "react";
import { Link } from "react-router-dom";
import { IoIosArrowBack } from "react-icons/io";
import { CiMenuKebab } from "react-icons/ci";
import './airship-edit-management.css';

export default function AirshipEditManagement() {
    const [formData, setFormDat] = useState({
        matricula: "FAB-754", 
        aereonave: "AS 350 - B3",
        fabricante: "Nasa",
        peso: "1361.0",
        pesovacio: "1260.0",
        pesomaximo: "1100.0",
        serial: "4547", 
        manufactureDate: "1990-01-01",
        combustible:"120.026   LTS",
        estado: "Whisky",
        origin: "Australia",
        modeloMotor: "C-R124",
        capacidadPasajero: "5",
       
      });

      const handleChange = (e: React.ChangeEvent<HTMLInputElement | HTMLSelectElement>) => {
        const { name, value } = e.target;
        setFormDat({
          ...formData,
          [name]: value,
        });
      };
    return (
        <div className="airship-edit-management-container">
            {/* Botón de regreso HOLA ANETT*/}
                <div>
                    <h1>
                        <Link to={"/menu-principal/menu-operaciones/gestion-aereonave"}><IoIosArrowBack className="goback-arrow" /></Link>GESTIÓN AERONAVES
                        <span className="small-text"> &gt; Editar AeroNave</span>
                    </h1>
                </div>
                
                <div className="aeronave-container">
                    
                    <div className="aeronave-content">
                        <div className="info-section">
                        <div className="label-input-container">
                                <label className="label-section"><strong>Matrícula:</strong></label>
                                <input type="text" name="matricula" value={formData.matricula} onChange={handleChange}/>
                            </div>
                            
                            <div className="label-input-container">
                                <label className="label-section"><strong>Modelo:</strong></label>
                                <input type="text" name="aereonave" value={formData.aereonave} onChange={handleChange}/>
                            </div>
                            <div className="label-input-container">
                                <br />
                                <label className="label-section"><strong>Fabricante:</strong></label>
                                <input type="text" name="fabricante" value={formData.fabricante} onChange={handleChange}/>
                            </div>
                            <div className="label-input-container">
                                <br />
                                <label className="label-section"><strong>Peso Definido(Kg):</strong></label>
                                <input type="text" name="peso" value={formData.peso} onChange={handleChange}/>
                            </div>
                            <div className="label-input-container">
                                <br />
                                <label className="label-section"><strong>Peso Máximo(Kg):</strong></label>
                                <input type="text" name="pesovacio" value={formData.pesovacio} onChange={handleChange}/>
                            </div>
                            <div className="label-input-container">
                                <br />
                                <label className="label-section"><strong>Peso Vacío(Kg):</strong></label>
                                <input type="text" name="pesomaximo" value={formData.pesomaximo} onChange={handleChange}/>
                            </div>
                            <div className="label-input-container">
                                <br />
                                <label className="label-section"><strong>Serial:</strong></label>
                                <input type="text" name="serial" value={formData.serial} onChange={handleChange}/>
                            </div>
                            <div className="label-input-container">
                                <br />
                                <label className="label-section"><strong>Capacidad De Combustible:</strong></label>
                                <input type="text" name="combustible" value={formData.combustible} onChange={handleChange}/>
                            </div>
                            <div className="register-airshit-label-input-container">
                                <br />
                                <label className="label-section"><strong>Fecha de Fabricación:</strong></label>
                                <input type="date" name="manufactureDate" value={formData.manufactureDate} onChange={handleChange}/>
                            </div>
                            
                            <div className="label-input-container">
                                <br />
                                <label className="label-section"><strong>Origen de AeroNave:</strong></label>
                                <input type="text" name="origin" value={formData.origin} onChange={handleChange}/>
                            </div>
                            
                            <div className="register-airshit-estado-label-input-container">
                                <br />
                                <label className="label-section"><strong>Estado:</strong></label>
                                <select name="estado" value={formData.estado} onChange={handleChange}>
                                    <option value="disponible">Whisky</option>
                                    <option value="noDisponible">Papa</option>
                                </select>
                            </div>
                            
                            <div className="label-input-container">
                                <br />
                                <label className="label-section"><strong>Modelo de Motor:</strong></label>
                                <input type="text" name="modeloMotor" value={formData.modeloMotor} onChange={handleChange}/>
                            </div>
                            <div className="label-input-container">
                                <br />
                                <label className="label-section"><strong>Capacidad de Pasajeros:</strong></label>
                                <input type="text" name="capacidadPasajero" value={formData.capacidadPasajero} onChange={handleChange}/>
                            </div>
                            <div className="label-input-container">
                                <br />
                                <label className="label-section"><strong>Horas de Vuelo:</strong></label>
                                <div className="time-inputs">
                                    <input type="number" min="0" placeholder="Horas" />
                                    <input type="number" min="0" max="59" placeholder="Minutos" />
                                </div>
                            </div>
                            <div className="label-input-container">
                                <br />
                                <label className="label-section"><strong>Horas de Mantenimiento:</strong></label>
                                <div className="time-inputs">
                                    <input type="number" min="0" placeholder="Horas" />
                                    <input type="number" min="0" max="59" placeholder="Minutos" />
                                </div>
                            </div>


                        </div>
                        
                        <div>
                            <button className="edit-button">Realizar Cambio</button>
                        </div>
                        <br />
                        <br />
                    </div>
                </div>
                
                <div className="airship-edit-user-info-container">
                    <span className="username">USER76234</span>
                    <button className="forma">
                        <CiMenuKebab fontSize={24} />
                    </button>
                    <div className="airship-edit-management-logo">
                        <img width={200} height={150}  src="/FAB.png" alt="FAB" />
                    </div>
                </div>
        </div>
    );
}