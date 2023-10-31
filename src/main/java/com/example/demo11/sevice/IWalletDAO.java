package com.example.demo11.sevice;

import com.example.demo11.model.Wallet;

import java.util.List;

public interface IWalletDAO {
    List<Wallet> listWallet(String name,String password);
    List<Wallet> listWalletHome();
    Wallet checkID(int id);
}
