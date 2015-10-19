using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

using DAL;

namespace BLL
{
    public class MemberHandler
    {
        MemberDBAccess memberDB = null;

        public MemberHandler()
        {
            memberDB = new MemberDBAccess();
        }

        public bool AddNewMember(Member member)
        {
            member.Password = StringCipher.Encrypt(member.Password, "12345easibook12345");
            return memberDB.AddNewMember(member);
        }

        public Member ValidateLogin(string email, string password)
        {
            string encryptedPassword = StringCipher.Encrypt(password, "12345easibook12345");
            return memberDB.ValidateLogin(email, encryptedPassword);
        }

        public Member GetMemberDetails(int memberID)
        {
            return memberDB.GetMemberDetails(memberID);
        }

        public bool UpdateMember(Member member)
        {
            return memberDB.UpdateMember(member);
        }

        public bool UpdateMemberWithPassword(Member member)
        {
            member.Password = StringCipher.Encrypt(member.Password, "12345easibook12345");
            return memberDB.UpdateMemberWithPassword(member);
        }

        public bool ValidateEmail(string email)
        {
            Member member = new Member();
            member = memberDB.ValidateEmail(email);
            bool exists = false;
            try
            {
                if (member.Email != null)
                    exists = true;
            }
            catch (NullReferenceException)
            {
                exists = false;
            }
            return exists;
        }

        public int GetRole(int memberID)
        {
            return memberDB.GetRole(memberID);
        }

        public List<Member> GetMemberNameList()
        {
            return memberDB.GetMemberNameList();
        }

        public List<Member> GetMemberSearchList(string searchQuery)
        {
            return memberDB.GetMemberSearchList(searchQuery);
        }

        public bool UpdateMemberPassword(Member member)
        {
            member.Password = StringCipher.Encrypt(member.Password, "12345easibook12345");
            return memberDB.UpdateMemberPassword(member);
        }
    }
}
