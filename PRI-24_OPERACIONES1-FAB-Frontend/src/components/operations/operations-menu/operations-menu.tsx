import "./operations-menu.css"
import { FaPlane } from "react-icons/fa";
import { GoCopilot } from "react-icons/go";
import { Link } from "react-router-dom"
import { RiHealthBookLine } from "react-icons/ri";
import { IoIosArrowBack } from "react-icons/io";

export default function OperationsMenu() {
    return <>
        <div className="operations-menu-container">
            <header>
                <Link className="back-icon" to={"/menu-principal"}>
                    <IoIosArrowBack className="goback-arrow" />
                </Link>
                OPERACIONES AEREAS
            </header>
            <main>
                <img src="/FAB.png" width={400} height={250} />
                <h1>Fuerza Aérea</h1>
                <span className="box-oparations1">                    
                    <div className="container-operations1 menu-options main-options">
                        <Link className="option" to={"/menu-principal/menu-operaciones/gestion-aereonave"}>
                            <p>
                                <FaPlane fontSize={52} />
                                <span>AERONAVES</span>
                            </p>
                        </Link>
                        <Link className="option" to={"/menu-principal/menu-operaciones/gestion-pilotos"}>
                            <p>
                                <GoCopilot fontSize={64} />
                                <span>PILOTOS</span>
                            </p>
                        </Link>
                        <Link className="option" to={"/menu-principal/menu-operaciones/mc-lista"}>
                            <p>
                                <RiHealthBookLine fontSize={62} />
                                <span>CHEQUEOS MEDICOS</span>
                            </p>
                        </Link>
                    </div>
                </span>
            </main>
        </div>
    </>
}