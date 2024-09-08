import { useState } from "react";
import { useNavigate } from "react-router-dom";
import "./login.css";

export default function Login() {
    const [username, setUsername] = useState("");
    const [password, setPassword] = useState("");
    const [isCheckboxChecked, setIsCheckboxChecked] = useState(false);

    const goTo = useNavigate();

    const handleCheckboxChange = (event: { target: { checked: any; }; }) => {
        setIsCheckboxChecked(event.target.checked);
    };

    function handleSubmit(e: React.FormEvent<HTMLFormElement>) {
        e.preventDefault();
        goTo("/menu-principal");
    }
    
    return <>
        <div className="login-container">
            <div className="login-card">
                <h2>Bienvenido de nuevo</h2>
                <form onSubmit={handleSubmit}>
                    <input type="text" className="form-control" name="user" id="user" placeholder="Usuario" value={username} onChange={(e) => setUsername(e.target.value)}/>
                    <input type={isCheckboxChecked? "text" : "password"} className="form-control" name="password" id="password" placeholder="Contaseña" value={password} onChange={(e) => setPassword(e.target.value)}/>
                    <input className="checkbox" type="checkbox" id="showPassword" checked={isCheckboxChecked} onChange={handleCheckboxChange}/> Mostrar contaseña
                    <button className="btn btn-blue"> iniciar sesion </button>                 
                </form>     
            </div>            
        </div>
    </>
}