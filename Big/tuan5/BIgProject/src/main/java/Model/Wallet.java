package Model;

public class Wallet {
    int idWallet;
    String icon;
    String nameWallet;
    int money;
    String currency;
    String description;

    public Wallet(String icon, String nameWallet, int money, String currency, String description) {
        this.icon = icon;
        this.nameWallet = nameWallet;
        this.money = money;
        this.currency = currency;
        this.description = description;
    }

    public Wallet(int idWallet, String icon, String nameWallet, int money, String currency, String description) {
        this.idWallet = idWallet;
        this.icon = icon;
        this.nameWallet = nameWallet;
        this.money = money;
        this.currency = currency;
        this.description = description;
    }

    public Wallet() {
    }

    public int getIdWallet() {
        return idWallet;
    }

    public void setIdWallet(int idWallet) {
        this.idWallet = idWallet;
    }

    public String getIcon() {
        return icon;
    }

    public void setIcon(String icon) {
        this.icon = icon;
    }

    public String getNameWallet() {
        return nameWallet;
    }

    public void setNameWallet(String nameWallet) {
        this.nameWallet = nameWallet;
    }

    public int getMoney() {
        return money;
    }

    public void setMoney(int money) {
        this.money = money;
    }

    public String getCurrency() {
        return currency;
    }

    public void setCurrency(String currency) {
        this.currency = currency;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }
}
