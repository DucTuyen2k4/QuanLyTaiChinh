package Service;

import Model.JDBC;
import Model.Wallet;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class WalletDao implements IWalletDao {

    @Override
    public void AddWallet(Wallet wallet) throws SQLException, ClassNotFoundException {
        String ADD_WALLET="insert into wallet(icon,nameWallet,money,currency,description) values(?,?,?,?,?)";
        PreparedStatement preparedStatement = JDBC.connection().prepareStatement(ADD_WALLET);
        preparedStatement.setString(1,wallet.getIcon());
        preparedStatement.setString(2,wallet.getNameWallet());
        preparedStatement.setInt(3,wallet.getMoney());
        preparedStatement.setString(4,wallet.getCurrency());
        preparedStatement.setString(5,wallet.getDescription());
        preparedStatement.executeUpdate();
    }

    @Override
    public List<Wallet> ShowWallet(int id) throws SQLException, ClassNotFoundException {
        List<Wallet>wallets=new ArrayList<>();
        String SHOW_WALLET="SELECT u.id, u.userName,w.idWallet,w.nameWallet,w.money,w.currency,w.description FROM user u JOIN user_wallet uw ON u.id = uw.idUser JOIN wallet w ON uw.wallet_id = w.idWallet WHERE u.id = ?";
        PreparedStatement statement=JDBC.connection().prepareStatement(SHOW_WALLET);
        statement.setInt(1,id);
        ResultSet resultSet=statement.executeQuery();
        while (resultSet.next()){
            int idWallet=resultSet.getInt("idWallet");
            String icon=resultSet.getString("icon");
            int money=resultSet.getInt("money");
            String nameWallet=resultSet.getString("nameWallet");
            String currency=resultSet.getString("currency");
            String description=resultSet.getString("description");
            wallets.add(new Wallet(idWallet,icon,nameWallet,money,currency,description));
        }
return wallets;
    }
}
