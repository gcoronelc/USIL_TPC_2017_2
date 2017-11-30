package pe.egcc.colegio.model;

public class Usuario {

  private Integer idempleado;
  private Integer idrol;
  private String usuario;
  private String clave;
  private Integer estado;
  
  public Usuario() {
  }

  public Integer getIdempleado() {
    return idempleado;
  }

  public void setIdempleado(Integer idempleado) {
    this.idempleado = idempleado;
  }

  public Integer getIdrol() {
    return idrol;
  }

  public void setIdrol(Integer idrol) {
    this.idrol = idrol;
  }

  public String getUsuario() {
    return usuario;
  }

  public void setUsuario(String usuario) {
    this.usuario = usuario;
  }

  public String getClave() {
    return clave;
  }

  public void setClave(String clave) {
    this.clave = clave;
  }

  public Integer getEstado() {
    return estado;
  }

  public void setEstado(Integer estado) {
    this.estado = estado;
  }

  
}
