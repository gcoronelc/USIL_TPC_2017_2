package pe.egcc.promapp.model;

public class PromModel {

  // Input
  private int prct1;
  private int prct2;
  private int prct3;
  private int ep;
  private int ef;

  // Output
  private int pp;
  private int pf;
  private String cond;

  public PromModel() {
  }

  public PromModel(int prct1, int prct2, int prct3, int ep, int ef) {
    this.prct1 = prct1;
    this.prct2 = prct2;
    this.prct3 = prct3;
    this.ep = ep;
    this.ef = ef;
  }

  public int getPrct1() {
    return prct1;
  }

  public void setPrct1(int prct1) {
    this.prct1 = prct1;
  }

  public int getPrct2() {
    return prct2;
  }

  public void setPrct2(int prct2) {
    this.prct2 = prct2;
  }

  public int getPrct3() {
    return prct3;
  }

  public void setPrct3(int prct3) {
    this.prct3 = prct3;
  }

  public int getEp() {
    return ep;
  }

  public void setEp(int ep) {
    this.ep = ep;
  }

  public int getEf() {
    return ef;
  }

  public void setEf(int ef) {
    this.ef = ef;
  }

  public int getPp() {
    return pp;
  }

  public void setPp(int pp) {
    this.pp = pp;
  }

  public int getPf() {
    return pf;
  }

  public void setPf(int pf) {
    this.pf = pf;
  }

  public String getCond() {
    return cond;
  }

  public void setCond(String cond) {
    this.cond = cond;
  }

}
