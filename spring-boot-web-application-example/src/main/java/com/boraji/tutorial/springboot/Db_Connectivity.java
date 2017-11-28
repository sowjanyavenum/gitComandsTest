package com.boraji.tutorial.springboot;

import java.net.UnknownHostException;

import com.mongodb.DB;
import com.mongodb.DBCollection;
import com.mongodb.Mongo;

public class Db_Connectivity {
	
	// hey im here for first commit
	final String HOST="localhost";
	final int PORT=27017;
	final String DBNAME="javablogs";
	public static Db_Connectivity instance;
	public Mongo connection;
	public DB database;
	
	@SuppressWarnings("deprecation")
	private Db_Connectivity() throws UnknownHostException
	{
		System.out.println("Hey i cam hereeeeee........");
	this.connection=new Mongo(this.HOST,this.PORT);
	this.database=this.connection.getDB(this.DBNAME);
	}
	public static Db_Connectivity createInstance() throws UnknownHostException
	{
	  if(Db_Connectivity.instance==null)
	      {
	       Db_Connectivity.instance=new Db_Connectivity();
	      }
	  return Db_Connectivity.instance;
	}
	public DBCollection getCollection(String name)
	{
		System.out.println("******************the coolection name is"+this.database.getCollection(name));
	return this.database.getCollection(name);
	
	}
	}

