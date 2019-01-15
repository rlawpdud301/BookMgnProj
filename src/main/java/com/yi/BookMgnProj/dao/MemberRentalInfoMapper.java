package com.yi.BookMgnProj.dao;

import java.util.List;

import com.yi.BookMgnProj.model.MemberRentalInfo;

public interface MemberRentalInfoMapper {
	List<MemberRentalInfo> selectMemberRentalInfoByAll();

	MemberRentalInfo selectMemberRentalInfoByCode(MemberRentalInfo memberRentalInfo);

	int insertMemberRentalInfo(MemberRentalInfo memberRentalInfo);

	int updateMemberRentalInfo(MemberRentalInfo memberRentalInfo);

	int updateMemberRentalInfoGrade(MemberRentalInfo memberRentalInfo);

	int updateMemberRentalInfo2(MemberRentalInfo memberRentalInfo);

	MemberRentalInfo selectMemberNowTotalByCode(MemberRentalInfo memberRentalInfo);

	MemberRentalInfo selectMemberTotalByCode(MemberRentalInfo memberRentalInfo);

	MemberRentalInfo selectMemberGradeByCode(MemberRentalInfo memberRentalInfo);
}
