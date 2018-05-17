package com.shiva.dao;

import java.util.ArrayList;
import java.util.List;
import org.hibernate.Hibernate;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;


import com.shiva.model.Protocol;
import com.shiva.model.UserRegistration;
import com.shiva.util.HibernateUtil;

@Repository
public class ProtocolDaoImpl implements ProtocolDao{
	@Autowired
	private SessionFactory sessionfactory;
	@Autowired
	private HibernateUtil hibernateUtil;
	public void setSessionFactory(SessionFactory sf) 
	{
	this.sessionfactory = sf;
	}
	@Override
	public void addProtocol(Protocol protocol) {
		Session session=sessionfactory.getCurrentSession();
		session.save(protocol);
		
	}

	@Override
	public List<Protocol> getAllProtocols() {
		Session session=sessionfactory.getCurrentSession();
		List<Protocol> getAll=session.createQuery("from Protocol").list();
		return getAll;
	}

	@Override
	public Protocol getProtocol(int id) {
		Session session=sessionfactory.getCurrentSession();
		Protocol protocol=session.get(Protocol.class,id);
		return protocol;
	}

	@Override
	public void updateProtocol(Protocol protocol) 
	{
		Session session=sessionfactory.getCurrentSession();
		Hibernate.initialize(protocol);
		session.update(protocol);
		
	}

	@Override
	public void deleteProtocol(int id) {
		Session session=sessionfactory.getCurrentSession();
		Protocol data=session.load(Protocol.class, new Integer(id));
		if(null!=data)
		{
			session.delete(data);
		}
		
	}

	@Override
	public List<Protocol> search(String protocolName) {
		
		return null;
	}
	
	@Override
	public List<Protocol> searchByName(String protocolName) {
		Session session=this.sessionfactory.getCurrentSession();
		String query="SELECT p.* FROM Protocol p where p.protocolName like '%"+protocolName+"%'";
		//String query="SELECT p.* FROM Protocol p where p.protocolName like '%"+protocolName+"%'";
		//List<Object[]> protocolObjects=session.createQuery(query).list();
		List<Object[]> protocolObjects=hibernateUtil.fetchAll(query);
		List<Protocol> protocols=new ArrayList<Protocol>();
		for(Object[] protocolObject:protocolObjects)
		{
			Protocol protocol=new Protocol();
			int id=(Integer) protocolObject[0];
			String prot=(String) protocolObject[1];
			String desc=(String) protocolObject[2];
			protocol.setId(id);
			protocol.setProtocolName(prot);
			protocol.setDescription(desc);
			protocols.add(protocol);
		}
		return protocols;
		//Query query= session.createQuery("select familyName from Family");
		//return query.list();
	}
	@Override
	public void addNewUser(UserRegistration userRegistration) {
		Session session=sessionfactory.getCurrentSession();
		session.save(userRegistration);
	}
	@Override
	public List<UserRegistration> getUser( String email,String password) {
		Session session=this.sessionfactory.getCurrentSession();
		String query="SELECT p.* FROM UserRegistration p where p.email like '%"+email+"%' AND  p.password like '%"+password+"%'" ;
		//String query="SELECT p.* FROM Protocol p where p.protocolName like '%"+protocolName+"%'";
		//List<Object[]> protocolObjects=session.createQuery(query).list();
		List<Object[]> userObjects=hibernateUtil.fetchAll(query);
		List<UserRegistration> users=new ArrayList<UserRegistration>();
		for(Object[] userObject:userObjects)
		{
			UserRegistration userrr=new UserRegistration();
			int id=(Integer) userObject[0];
			String fname=(String) userObject[1];
			String lname=(String) userObject[2];
			String emaill=(String) userObject[1];
			String pass=(String) userObject[2];
			userrr.setId(id);
			userrr.setFirstName(fname);
			userrr.setLastName(lname);
			userrr.setEmail(emaill);
			userrr.setPassword(pass);
			
			users.add(userrr);
		}
		return users;
		//Query query= session.createQuery("select familyName from Family");
		//return query.list();
	}
}
