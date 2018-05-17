package com.shiva.dao;

import java.util.List;

import com.shiva.model.Protocol;
import com.shiva.model.UserRegistration;

public interface ProtocolDao {
	public void addNewUser(UserRegistration userRegistration);
	public void addProtocol(Protocol protocol);
	public List<Protocol> getAllProtocols();
	public Protocol getProtocol(int id);
	public void updateProtocol(Protocol protocol);
	public void deleteProtocol(int id);
	public List<Protocol> search(String protocolName);
	public List<Protocol> searchByName(String protocolName);
	public List<UserRegistration> getUser( String email,String password);

}
