package com.pepe.proyecto.Controllers;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController 
@RequestMapping ("/api/v1")
public class UnicoController {
    @GetMapping ("/unico")
    public String unicoEndpoint(){
        return "Hola, este es un endpoint único";
    }
}
