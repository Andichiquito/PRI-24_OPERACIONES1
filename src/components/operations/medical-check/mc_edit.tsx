import { Link } from "react-router-dom";
import { IoIosArrowBack } from "react-icons/io";
import { CiMenuKebab } from "react-icons/ci";
import './mc_register.css'

export default function McEdit (){
    return <>
        <div className="container">
            <div className='mc-container'>
                <div className="mc-header-action">
                    <a href="">
                        <Link className="mc-black" to={'/menu-principal/menu-operaciones/mc-lista'}><IoIosArrowBack size={20}/></Link>
                        <span>CHEQUEO MÉDICO</span>
                    </a>
                    <p>
                        <i className="material-icons"><img width={10} src="/chevron-right.png" alt=">" /></i>
                        <span>Editar chequeo</span>
                    </p>
                </div>

                <div className="mc-card-1">
                    <form action="">
                        <div className="mc-group">
                            <div className="mc-select-field">
                                <select>
                                    <option value="">Hugo Fernando Perez Oropeza</option>
                                    <option value="">Rodrigo Arnez Ramirez</option>
                                    <option value="">David Peredo Canedo</option>
                                </select>
                                <label>Personal</label>
                            </div>
                            <div className="mc-input-field">
                                <input type="text" value="Teniente" readOnly/>
                                <label>Grado</label>
                            </div>
                        </div>
                        
                        <h3 className="mc-title">CATEGORÍA</h3>
                        <div className="mc-group">
                            <div className="mc-input-field">
                                <input value="C.A" type="text"/>
                                <label>EC-145</label>
                            </div>
                            <div className="mc-input-field">
                                <input value="P.A" type="text"/>
                                <label>AS350 B3</label>
                            </div>
                        </div>
                        <div className="mc-group">
                            <div className="mc-input-field">
                                <input type="date"/>
                                <label>Próximo Chequeo</label>
                            </div>
                            <div className="mc-text-field">
                                <textarea value="Ninguna" rows={6} cols={17}></textarea>
                                <label>Observaciones</label>
                            </div>
                        </div>
                        <button className="mc-button" type="submit">Editar Chequeo</button>
                    </form>
                </div>

                <div className="mc-user-info-container">
                    <span className="mc-username">USER76234</span>
                    <button className="mc-forma">
                        <CiMenuKebab fontSize={20} />
                    </button>
                    <div className="mc-management-logo">
                        <img width={160} height={110}  src="/FAB.png" alt="FAB" />
                    </div>
                </div>
            </div>
        </div>
    </>
}