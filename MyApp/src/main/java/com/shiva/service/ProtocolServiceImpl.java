package com.shiva.service;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.shiva.dao.ProtocolDao;
import com.shiva.model.Protocol;
import com.shiva.model.UserRegistration;
@Service
public class ProtocolServiceImpl implements ProtocolService{
	@Autowired
	private ProtocolDao protocolDao;
	@Override
	@Transactional
	public void addProtocol(Protocol protocol) {
		protocolDao.addProtocol(protocol);
		
	}

	@Override
	@Transactional
	public List<Protocol> getAllProtocols() {
		
		return protocolDao.getAllProtocols();
	}

	@Override
	@Transactional
	public Protocol getProtocol(int id) {
		Protocol protocol=protocolDao.getProtocol(id);
		return protocol;
	}

	@Override
	@Transactional
	public void updateProtocol(Protocol protocol) {
		protocolDao.updateProtocol(protocol);
		
	}

	@Override
	@Transactional
	public void deleteProtocol(int id) {
		protocolDao.deleteProtocol(id);
	}

	@Override
	@Transactional
	public List<Protocol> searchByName(String protocolName) {
		
		return protocolDao.searchByName(protocolName);
	}

	@Override
	@Transactional
	public void addNewUser(UserRegistration userRegistration) {
		protocolDao.addNewUser(userRegistration);
		
	}

	@Override
	@Transactional
	public List<UserRegistration> getUser(String email, String password) {
		
		return protocolDao.getUser(email, password);
	}

}
