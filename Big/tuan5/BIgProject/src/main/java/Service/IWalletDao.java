package Service;

import Model.Wallet;

import java.sql.SQLException;
import java.util.List;

public interface IWalletDao {
void AddWallet (Wallet wallet) throws SQLException, ClassNotFoundException;
List<Wallet> ShowWallet(int id) throws SQLException, ClassNotFoundException;
}
