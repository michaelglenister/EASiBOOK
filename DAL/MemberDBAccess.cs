using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

using System.Data;
using System.Data.SqlClient;

namespace DAL
{
    public class MemberDBAccess
    {
        public bool AddNewMember(Member member)
        {
            SqlParameter[] parameters = new SqlParameter[]
		    {                
			    new SqlParameter("@Email", member.Email),
			    new SqlParameter("@Password", member.Password),
			    new SqlParameter("@FirstName", member.FirstName),
			    new SqlParameter("@Surname", member.Surname),
			    new SqlParameter("@AddressLine1", member.AddressLine1),
			    new SqlParameter("@AddressLine2", member.AddressLine2),
                new SqlParameter("@Suburb", member.Suburb),
			    new SqlParameter("@PostalCode", member.PostalCode),
			    new SqlParameter("@City", member.City),
			    new SqlParameter("@PhoneNo", member.PhoneNo)
		    };

            return DBHelper.ExecuteNonQuery("sp_AddNewMember", CommandType.StoredProcedure, parameters);
        }

        public Member ValidateLogin(string email, string password)
        {
            Member member = null;

            SqlParameter[] paramaters = new SqlParameter[]
            {
                new SqlParameter("@Email", email),
                new SqlParameter("@Password", password)
            };

            using (DataTable table = DBHelper.ExecuteParamerizedSelectCommand("sp_ValidateLogin", CommandType.StoredProcedure, paramaters))
            {
                if (table.Rows.Count == 1)
                {
                    DataRow row = table.Rows[0];

                    member = new Member();

                    member.MemberID = Convert.ToInt32(row["MemberID"]);
                    member.FirstName = row["FirstName"].ToString();
                    member.Surname = row["Surname"].ToString();
                    member.Role = Convert.ToInt32(row["Role"]);
                }
            }
            return member;
        }

        public Member GetMemberDetails(int memberID)
        {
            Member member = null;

            SqlParameter[] paramaters = new SqlParameter[]
            {
                new SqlParameter("@MemberID", memberID),
            };

            using (DataTable table = DBHelper.ExecuteParamerizedSelectCommand("sp_GetMemberDetails", CommandType.StoredProcedure, paramaters))
            {
                if (table.Rows.Count == 1)
                {
                    DataRow row = table.Rows[0];

                    member = new Member();

                    member.MemberID = Convert.ToInt32(row["MemberID"]);
                    member.FirstName = row["FirstName"].ToString();
                    member.Surname = row["Surname"].ToString();
                    member.AddressLine1 = row["AddressLine1"].ToString();
                    member.AddressLine2 = row["AddressLine2"].ToString();
                    member.Suburb = row["Suburb"].ToString();
                    member.PostalCode = row["PostalCode"].ToString();
                    member.City = row["City"].ToString();
                    member.PhoneNo = row["PhoneNo"].ToString();
                    member.Email = row["Email"].ToString();
                    member.Role = Convert.ToInt32(row["Role"]);
                }
            }
            return member;
        }

        public bool UpdateMember(Member member)
        {
            SqlParameter[] parameters = new SqlParameter[]
            {
                new SqlParameter("@MemberID", member.MemberID),
                new SqlParameter("@FirstName", member.FirstName),
                new SqlParameter("@Surname", member.Surname),
                new SqlParameter("@AddressLine1", member.AddressLine1),
                new SqlParameter("@AddressLine2", member.AddressLine2),
                new SqlParameter("@Suburb", member.Suburb),
                new SqlParameter("@PostalCode", member.PostalCode),
                new SqlParameter("@City", member.City),
                new SqlParameter("@PhoneNo", member.PhoneNo),
                new SqlParameter("@Email", member.Email),
                new SqlParameter("@Role", member.Role)
            };
            return DBHelper.ExecuteNonQuery("sp_UpdateMember", CommandType.StoredProcedure, parameters);
        }

        public bool UpdateMemberWithPassword(Member member)
        {
            SqlParameter[] parameters = new SqlParameter[]
            {
                new SqlParameter("@MemberID", member.MemberID),
                new SqlParameter("@FirstName", member.FirstName),
                new SqlParameter("@Surname", member.Surname),
                new SqlParameter("@AddressLine1", member.AddressLine1),
                new SqlParameter("@AddressLine2", member.AddressLine2),
                new SqlParameter("@Suburb", member.Suburb),
                new SqlParameter("@PostalCode", member.PostalCode),
                new SqlParameter("@City", member.City),
                new SqlParameter("@PhoneNo", member.PhoneNo),
                new SqlParameter("@Email", member.Email),
                new SqlParameter("@Password", member.Password),
                new SqlParameter("@Role", member.Role)
            };
            return DBHelper.ExecuteNonQuery("sp_UpdateMemberWithPassword", CommandType.StoredProcedure, parameters);
        }

        public Member ValidateEmail(string email)
        {
            Member member = null;

            SqlParameter[] paramaters = new SqlParameter[]
            {
                new SqlParameter("@Email", email)
            };

            using (DataTable table = DBHelper.ExecuteParamerizedSelectCommand("sp_ValidateEmail", CommandType.StoredProcedure, paramaters))
            {
                if (table.Rows.Count == 1)
                {
                    DataRow row = table.Rows[0];

                    member = new Member();

                    member.Email = row["Email"].ToString();
                }
            }
            return member;
        }

        public int GetRole(int memberID)
        {
            int role = 1;

            SqlParameter[] parameters = new SqlParameter[]
		    {                
                new SqlParameter("@MemberID", memberID)
		    };

            using (DataTable table = DBHelper.ExecuteParamerizedSelectCommand("sp_GetRole", CommandType.StoredProcedure, parameters))
            {
                if (table.Rows.Count >= 1)
                {
                    DataRow row = table.Rows[0];
                    role = Convert.ToInt32(row["Role"]);
                }
            }
            return role;
        }

        public List<Member> GetMemberNameList()
        {
            List<Member> listMembers = null;

            using (DataTable table = DBHelper.ExecuteSelectCommand("sp_GetMemberNameList", CommandType.StoredProcedure))
            {
                if (table.Rows.Count > 0)
                {
                    listMembers = new List<Member>();

                    foreach (DataRow row in table.Rows)
                    {
                        Member member = new Member();
                        member.MemberID = Convert.ToInt32(row["MemberID"]);
                        member.Name = row["Name"].ToString();

                        listMembers.Add(member);
                    }
                }
            }

            return listMembers;
        }

        public List<Member> GetMemberSearchList(string searchQuery)
        {
            List<Member> listMembers = null;

            SqlParameter[] paramaters = new SqlParameter[]
            {
                new SqlParameter("@SearchQuery", searchQuery),
            };

            using (DataTable table = DBHelper.ExecuteParamerizedSelectCommand("sp_GetMemberSearchList", CommandType.StoredProcedure, paramaters))
            {
                if (table.Rows.Count > 0)
                {
                    listMembers = new List<Member>();

                    foreach (DataRow row in table.Rows)
                    {
                        Member member = new Member();
                        member.MemberID = Convert.ToInt32(row["MemberID"]);
                        member.Name = row["Name"].ToString();

                        listMembers.Add(member);
                    }
                }
            }

            return listMembers;
        }

        public bool UpdateMemberPassword(Member member)
        {
            SqlParameter[] parameters = new SqlParameter[]
            {
                new SqlParameter("@Email", member.Email),
                new SqlParameter("@Password", member.Password)
            };
            return DBHelper.ExecuteNonQuery("sp_UpdateMemberPassword", CommandType.StoredProcedure, parameters);
        }
    }
}
