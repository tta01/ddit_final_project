package jobja.ranking.mapper;

import java.util.List;
import java.util.Map;

import jobja.member.vo.EnterpriseVO;

public interface EntRankingMapper {

	List<EnterpriseVO> entWelfareDesc();

	List<EnterpriseVO> entChancesDesc();

	List<EnterpriseVO> entBalanceDesc();

	List<EnterpriseVO> entCultureDesc();

	List<EnterpriseVO> entManagerDesc();

	List<EnterpriseVO> entAvgDesc();

	List<EnterpriseVO> getList(Map<String, Object> map);

	int getTotal(Map<String, Object> map);

}
