/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Modelo;

import Interfaces.CRUD;
import java.util.*;

/**
 *
 * @author Duvan
 */
public class EstudianteDAO implements CRUD {

    @Override
    public List list() {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public Object read(Object obj) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public boolean create(Object obj) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public boolean update(List list, Object obj) {
        List<EstudianteDTO> lista = (List<EstudianteDTO>) (Object) list;
        EstudianteDTO dto = (EstudianteDTO) (obj);
        for (int i = 0; i < lista.size(); i++) {
            if (lista.get(i).getCodigo().equals(dto.getCodigo())) {
                lista.set(i, dto);
            }
        }
        return false;
    }

    @Override
    public boolean delete(List list, Object obj) {
        List<EstudianteDTO> lista = (List<EstudianteDTO>) (Object) list;
        String codigo = (String) (obj);
        for (int i = 0; i < lista.size(); i++) {
            if (lista.get(i).getCodigo().equals(codigo)) {
                lista.remove(i);
            }
        }
        return false;
    }

}
