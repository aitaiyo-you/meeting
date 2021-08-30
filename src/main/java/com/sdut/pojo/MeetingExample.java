package com.sdut.pojo;

import java.util.ArrayList;
import java.util.List;

public class MeetingExample {
    protected String orderByClause;

    protected boolean distinct;

    protected List<Criteria> oredCriteria;

    public MeetingExample() {
        oredCriteria = new ArrayList<Criteria>();
    }

    public void setOrderByClause(String orderByClause) {
        this.orderByClause = orderByClause;
    }

    public String getOrderByClause() {
        return orderByClause;
    }

    public void setDistinct(boolean distinct) {
        this.distinct = distinct;
    }

    public boolean isDistinct() {
        return distinct;
    }

    public List<Criteria> getOredCriteria() {
        return oredCriteria;
    }

    public void or(Criteria criteria) {
        oredCriteria.add(criteria);
    }

    public Criteria or() {
        Criteria criteria = createCriteriaInternal();
        oredCriteria.add(criteria);
        return criteria;
    }

    public Criteria createCriteria() {
        Criteria criteria = createCriteriaInternal();
        if (oredCriteria.size() == 0) {
            oredCriteria.add(criteria);
        }
        return criteria;
    }

    protected Criteria createCriteriaInternal() {
        Criteria criteria = new Criteria();
        return criteria;
    }

    public void clear() {
        oredCriteria.clear();
        orderByClause = null;
        distinct = false;
    }

    protected abstract static class GeneratedCriteria {
        protected List<Criterion> criteria;

        protected GeneratedCriteria() {
            super();
            criteria = new ArrayList<Criterion>();
        }

        public boolean isValid() {
            return criteria.size() > 0;
        }

        public List<Criterion> getAllCriteria() {
            return criteria;
        }

        public List<Criterion> getCriteria() {
            return criteria;
        }

        protected void addCriterion(String condition) {
            if (condition == null) {
                throw new RuntimeException("Value for condition cannot be null");
            }
            criteria.add(new Criterion(condition));
        }

        protected void addCriterion(String condition, Object value, String property) {
            if (value == null) {
                throw new RuntimeException("Value for " + property + " cannot be null");
            }
            criteria.add(new Criterion(condition, value));
        }

        protected void addCriterion(String condition, Object value1, Object value2, String property) {
            if (value1 == null || value2 == null) {
                throw new RuntimeException("Between values for " + property + " cannot be null");
            }
            criteria.add(new Criterion(condition, value1, value2));
        }

        public Criteria andMidIsNull() {
            addCriterion("mid is null");
            return (Criteria) this;
        }

        public Criteria andMidIsNotNull() {
            addCriterion("mid is not null");
            return (Criteria) this;
        }

        public Criteria andMidEqualTo(Integer value) {
            addCriterion("mid =", value, "mid");
            return (Criteria) this;
        }

        public Criteria andMidNotEqualTo(Integer value) {
            addCriterion("mid <>", value, "mid");
            return (Criteria) this;
        }

        public Criteria andMidGreaterThan(Integer value) {
            addCriterion("mid >", value, "mid");
            return (Criteria) this;
        }

        public Criteria andMidGreaterThanOrEqualTo(Integer value) {
            addCriterion("mid >=", value, "mid");
            return (Criteria) this;
        }

        public Criteria andMidLessThan(Integer value) {
            addCriterion("mid <", value, "mid");
            return (Criteria) this;
        }

        public Criteria andMidLessThanOrEqualTo(Integer value) {
            addCriterion("mid <=", value, "mid");
            return (Criteria) this;
        }

        public Criteria andMidIn(List<Integer> values) {
            addCriterion("mid in", values, "mid");
            return (Criteria) this;
        }

        public Criteria andMidNotIn(List<Integer> values) {
            addCriterion("mid not in", values, "mid");
            return (Criteria) this;
        }

        public Criteria andMidBetween(Integer value1, Integer value2) {
            addCriterion("mid between", value1, value2, "mid");
            return (Criteria) this;
        }

        public Criteria andMidNotBetween(Integer value1, Integer value2) {
            addCriterion("mid not between", value1, value2, "mid");
            return (Criteria) this;
        }

        public Criteria andMnameIsNull() {
            addCriterion("mname is null");
            return (Criteria) this;
        }

        public Criteria andMnameIsNotNull() {
            addCriterion("mname is not null");
            return (Criteria) this;
        }

        public Criteria andMnameEqualTo(String value) {
            addCriterion("mname =", value, "mname");
            return (Criteria) this;
        }

        public Criteria andMnameNotEqualTo(String value) {
            addCriterion("mname <>", value, "mname");
            return (Criteria) this;
        }

        public Criteria andMnameGreaterThan(String value) {
            addCriterion("mname >", value, "mname");
            return (Criteria) this;
        }

        public Criteria andMnameGreaterThanOrEqualTo(String value) {
            addCriterion("mname >=", value, "mname");
            return (Criteria) this;
        }

        public Criteria andMnameLessThan(String value) {
            addCriterion("mname <", value, "mname");
            return (Criteria) this;
        }

        public Criteria andMnameLessThanOrEqualTo(String value) {
            addCriterion("mname <=", value, "mname");
            return (Criteria) this;
        }

        public Criteria andMnameLike(String value) {
            addCriterion("mname like", value, "mname");
            return (Criteria) this;
        }

        public Criteria andMnameNotLike(String value) {
            addCriterion("mname not like", value, "mname");
            return (Criteria) this;
        }

        public Criteria andMnameIn(List<String> values) {
            addCriterion("mname in", values, "mname");
            return (Criteria) this;
        }

        public Criteria andMnameNotIn(List<String> values) {
            addCriterion("mname not in", values, "mname");
            return (Criteria) this;
        }

        public Criteria andMnameBetween(String value1, String value2) {
            addCriterion("mname between", value1, value2, "mname");
            return (Criteria) this;
        }

        public Criteria andMnameNotBetween(String value1, String value2) {
            addCriterion("mname not between", value1, value2, "mname");
            return (Criteria) this;
        }

        public Criteria andMaddressIsNull() {
            addCriterion("maddress is null");
            return (Criteria) this;
        }

        public Criteria andMaddressIsNotNull() {
            addCriterion("maddress is not null");
            return (Criteria) this;
        }

        public Criteria andMaddressEqualTo(String value) {
            addCriterion("maddress =", value, "maddress");
            return (Criteria) this;
        }

        public Criteria andMaddressNotEqualTo(String value) {
            addCriterion("maddress <>", value, "maddress");
            return (Criteria) this;
        }

        public Criteria andMaddressGreaterThan(String value) {
            addCriterion("maddress >", value, "maddress");
            return (Criteria) this;
        }

        public Criteria andMaddressGreaterThanOrEqualTo(String value) {
            addCriterion("maddress >=", value, "maddress");
            return (Criteria) this;
        }

        public Criteria andMaddressLessThan(String value) {
            addCriterion("maddress <", value, "maddress");
            return (Criteria) this;
        }

        public Criteria andMaddressLessThanOrEqualTo(String value) {
            addCriterion("maddress <=", value, "maddress");
            return (Criteria) this;
        }

        public Criteria andMaddressLike(String value) {
            addCriterion("maddress like", value, "maddress");
            return (Criteria) this;
        }

        public Criteria andMaddressNotLike(String value) {
            addCriterion("maddress not like", value, "maddress");
            return (Criteria) this;
        }

        public Criteria andMaddressIn(List<String> values) {
            addCriterion("maddress in", values, "maddress");
            return (Criteria) this;
        }

        public Criteria andMaddressNotIn(List<String> values) {
            addCriterion("maddress not in", values, "maddress");
            return (Criteria) this;
        }

        public Criteria andMaddressBetween(String value1, String value2) {
            addCriterion("maddress between", value1, value2, "maddress");
            return (Criteria) this;
        }

        public Criteria andMaddressNotBetween(String value1, String value2) {
            addCriterion("maddress not between", value1, value2, "maddress");
            return (Criteria) this;
        }

        public Criteria andMbtimeIsNull() {
            addCriterion("mbtime is null");
            return (Criteria) this;
        }

        public Criteria andMbtimeIsNotNull() {
            addCriterion("mbtime is not null");
            return (Criteria) this;
        }

        public Criteria andMbtimeEqualTo(String value) {
            addCriterion("mbtime =", value, "mbtime");
            return (Criteria) this;
        }

        public Criteria andMbtimeNotEqualTo(String value) {
            addCriterion("mbtime <>", value, "mbtime");
            return (Criteria) this;
        }

        public Criteria andMbtimeGreaterThan(String value) {
            addCriterion("mbtime >", value, "mbtime");
            return (Criteria) this;
        }

        public Criteria andMbtimeGreaterThanOrEqualTo(String value) {
            addCriterion("mbtime >=", value, "mbtime");
            return (Criteria) this;
        }

        public Criteria andMbtimeLessThan(String value) {
            addCriterion("mbtime <", value, "mbtime");
            return (Criteria) this;
        }

        public Criteria andMbtimeLessThanOrEqualTo(String value) {
            addCriterion("mbtime <=", value, "mbtime");
            return (Criteria) this;
        }

        public Criteria andMbtimeLike(String value) {
            addCriterion("mbtime like", value, "mbtime");
            return (Criteria) this;
        }

        public Criteria andMbtimeNotLike(String value) {
            addCriterion("mbtime not like", value, "mbtime");
            return (Criteria) this;
        }

        public Criteria andMbtimeIn(List<String> values) {
            addCriterion("mbtime in", values, "mbtime");
            return (Criteria) this;
        }

        public Criteria andMbtimeNotIn(List<String> values) {
            addCriterion("mbtime not in", values, "mbtime");
            return (Criteria) this;
        }

        public Criteria andMbtimeBetween(String value1, String value2) {
            addCriterion("mbtime between", value1, value2, "mbtime");
            return (Criteria) this;
        }

        public Criteria andMbtimeNotBetween(String value1, String value2) {
            addCriterion("mbtime not between", value1, value2, "mbtime");
            return (Criteria) this;
        }

        public Criteria andMetimeIsNull() {
            addCriterion("metime is null");
            return (Criteria) this;
        }

        public Criteria andMetimeIsNotNull() {
            addCriterion("metime is not null");
            return (Criteria) this;
        }

        public Criteria andMetimeEqualTo(String value) {
            addCriterion("metime =", value, "metime");
            return (Criteria) this;
        }

        public Criteria andMetimeNotEqualTo(String value) {
            addCriterion("metime <>", value, "metime");
            return (Criteria) this;
        }

        public Criteria andMetimeGreaterThan(String value) {
            addCriterion("metime >", value, "metime");
            return (Criteria) this;
        }

        public Criteria andMetimeGreaterThanOrEqualTo(String value) {
            addCriterion("metime >=", value, "metime");
            return (Criteria) this;
        }

        public Criteria andMetimeLessThan(String value) {
            addCriterion("metime <", value, "metime");
            return (Criteria) this;
        }

        public Criteria andMetimeLessThanOrEqualTo(String value) {
            addCriterion("metime <=", value, "metime");
            return (Criteria) this;
        }

        public Criteria andMetimeLike(String value) {
            addCriterion("metime like", value, "metime");
            return (Criteria) this;
        }

        public Criteria andMetimeNotLike(String value) {
            addCriterion("metime not like", value, "metime");
            return (Criteria) this;
        }

        public Criteria andMetimeIn(List<String> values) {
            addCriterion("metime in", values, "metime");
            return (Criteria) this;
        }

        public Criteria andMetimeNotIn(List<String> values) {
            addCriterion("metime not in", values, "metime");
            return (Criteria) this;
        }

        public Criteria andMetimeBetween(String value1, String value2) {
            addCriterion("metime between", value1, value2, "metime");
            return (Criteria) this;
        }

        public Criteria andMetimeNotBetween(String value1, String value2) {
            addCriterion("metime not between", value1, value2, "metime");
            return (Criteria) this;
        }

        public Criteria andMnumIsNull() {
            addCriterion("mnum is null");
            return (Criteria) this;
        }

        public Criteria andMnumIsNotNull() {
            addCriterion("mnum is not null");
            return (Criteria) this;
        }

        public Criteria andMnumEqualTo(Integer value) {
            addCriterion("mnum =", value, "mnum");
            return (Criteria) this;
        }

        public Criteria andMnumNotEqualTo(Integer value) {
            addCriterion("mnum <>", value, "mnum");
            return (Criteria) this;
        }

        public Criteria andMnumGreaterThan(Integer value) {
            addCriterion("mnum >", value, "mnum");
            return (Criteria) this;
        }

        public Criteria andMnumGreaterThanOrEqualTo(Integer value) {
            addCriterion("mnum >=", value, "mnum");
            return (Criteria) this;
        }

        public Criteria andMnumLessThan(Integer value) {
            addCriterion("mnum <", value, "mnum");
            return (Criteria) this;
        }

        public Criteria andMnumLessThanOrEqualTo(Integer value) {
            addCriterion("mnum <=", value, "mnum");
            return (Criteria) this;
        }

        public Criteria andMnumIn(List<Integer> values) {
            addCriterion("mnum in", values, "mnum");
            return (Criteria) this;
        }

        public Criteria andMnumNotIn(List<Integer> values) {
            addCriterion("mnum not in", values, "mnum");
            return (Criteria) this;
        }

        public Criteria andMnumBetween(Integer value1, Integer value2) {
            addCriterion("mnum between", value1, value2, "mnum");
            return (Criteria) this;
        }

        public Criteria andMnumNotBetween(Integer value1, Integer value2) {
            addCriterion("mnum not between", value1, value2, "mnum");
            return (Criteria) this;
        }

        public Criteria andMintroIsNull() {
            addCriterion("mintro is null");
            return (Criteria) this;
        }

        public Criteria andMintroIsNotNull() {
            addCriterion("mintro is not null");
            return (Criteria) this;
        }

        public Criteria andMintroEqualTo(String value) {
            addCriterion("mintro =", value, "mintro");
            return (Criteria) this;
        }

        public Criteria andMintroNotEqualTo(String value) {
            addCriterion("mintro <>", value, "mintro");
            return (Criteria) this;
        }

        public Criteria andMintroGreaterThan(String value) {
            addCriterion("mintro >", value, "mintro");
            return (Criteria) this;
        }

        public Criteria andMintroGreaterThanOrEqualTo(String value) {
            addCriterion("mintro >=", value, "mintro");
            return (Criteria) this;
        }

        public Criteria andMintroLessThan(String value) {
            addCriterion("mintro <", value, "mintro");
            return (Criteria) this;
        }

        public Criteria andMintroLessThanOrEqualTo(String value) {
            addCriterion("mintro <=", value, "mintro");
            return (Criteria) this;
        }

        public Criteria andMintroLike(String value) {
            addCriterion("mintro like", value, "mintro");
            return (Criteria) this;
        }

        public Criteria andMintroNotLike(String value) {
            addCriterion("mintro not like", value, "mintro");
            return (Criteria) this;
        }

        public Criteria andMintroIn(List<String> values) {
            addCriterion("mintro in", values, "mintro");
            return (Criteria) this;
        }

        public Criteria andMintroNotIn(List<String> values) {
            addCriterion("mintro not in", values, "mintro");
            return (Criteria) this;
        }

        public Criteria andMintroBetween(String value1, String value2) {
            addCriterion("mintro between", value1, value2, "mintro");
            return (Criteria) this;
        }

        public Criteria andMintroNotBetween(String value1, String value2) {
            addCriterion("mintro not between", value1, value2, "mintro");
            return (Criteria) this;
        }

        public Criteria andEtc1IsNull() {
            addCriterion("etc1 is null");
            return (Criteria) this;
        }

        public Criteria andEtc1IsNotNull() {
            addCriterion("etc1 is not null");
            return (Criteria) this;
        }

        public Criteria andEtc1EqualTo(String value) {
            addCriterion("etc1 =", value, "etc1");
            return (Criteria) this;
        }

        public Criteria andEtc1NotEqualTo(String value) {
            addCriterion("etc1 <>", value, "etc1");
            return (Criteria) this;
        }

        public Criteria andEtc1GreaterThan(String value) {
            addCriterion("etc1 >", value, "etc1");
            return (Criteria) this;
        }

        public Criteria andEtc1GreaterThanOrEqualTo(String value) {
            addCriterion("etc1 >=", value, "etc1");
            return (Criteria) this;
        }

        public Criteria andEtc1LessThan(String value) {
            addCriterion("etc1 <", value, "etc1");
            return (Criteria) this;
        }

        public Criteria andEtc1LessThanOrEqualTo(String value) {
            addCriterion("etc1 <=", value, "etc1");
            return (Criteria) this;
        }

        public Criteria andEtc1Like(String value) {
            addCriterion("etc1 like", value, "etc1");
            return (Criteria) this;
        }

        public Criteria andEtc1NotLike(String value) {
            addCriterion("etc1 not like", value, "etc1");
            return (Criteria) this;
        }

        public Criteria andEtc1In(List<String> values) {
            addCriterion("etc1 in", values, "etc1");
            return (Criteria) this;
        }

        public Criteria andEtc1NotIn(List<String> values) {
            addCriterion("etc1 not in", values, "etc1");
            return (Criteria) this;
        }

        public Criteria andEtc1Between(String value1, String value2) {
            addCriterion("etc1 between", value1, value2, "etc1");
            return (Criteria) this;
        }

        public Criteria andEtc1NotBetween(String value1, String value2) {
            addCriterion("etc1 not between", value1, value2, "etc1");
            return (Criteria) this;
        }

        public Criteria andEtc2IsNull() {
            addCriterion("etc2 is null");
            return (Criteria) this;
        }

        public Criteria andEtc2IsNotNull() {
            addCriterion("etc2 is not null");
            return (Criteria) this;
        }

        public Criteria andEtc2EqualTo(String value) {
            addCriterion("etc2 =", value, "etc2");
            return (Criteria) this;
        }

        public Criteria andEtc2NotEqualTo(String value) {
            addCriterion("etc2 <>", value, "etc2");
            return (Criteria) this;
        }

        public Criteria andEtc2GreaterThan(String value) {
            addCriterion("etc2 >", value, "etc2");
            return (Criteria) this;
        }

        public Criteria andEtc2GreaterThanOrEqualTo(String value) {
            addCriterion("etc2 >=", value, "etc2");
            return (Criteria) this;
        }

        public Criteria andEtc2LessThan(String value) {
            addCriterion("etc2 <", value, "etc2");
            return (Criteria) this;
        }

        public Criteria andEtc2LessThanOrEqualTo(String value) {
            addCriterion("etc2 <=", value, "etc2");
            return (Criteria) this;
        }

        public Criteria andEtc2Like(String value) {
            addCriterion("etc2 like", value, "etc2");
            return (Criteria) this;
        }

        public Criteria andEtc2NotLike(String value) {
            addCriterion("etc2 not like", value, "etc2");
            return (Criteria) this;
        }

        public Criteria andEtc2In(List<String> values) {
            addCriterion("etc2 in", values, "etc2");
            return (Criteria) this;
        }

        public Criteria andEtc2NotIn(List<String> values) {
            addCriterion("etc2 not in", values, "etc2");
            return (Criteria) this;
        }

        public Criteria andEtc2Between(String value1, String value2) {
            addCriterion("etc2 between", value1, value2, "etc2");
            return (Criteria) this;
        }

        public Criteria andEtc2NotBetween(String value1, String value2) {
            addCriterion("etc2 not between", value1, value2, "etc2");
            return (Criteria) this;
        }
    }

    public static class Criteria extends GeneratedCriteria {

        protected Criteria() {
            super();
        }
    }

    public static class Criterion {
        private String condition;

        private Object value;

        private Object secondValue;

        private boolean noValue;

        private boolean singleValue;

        private boolean betweenValue;

        private boolean listValue;

        private String typeHandler;

        public String getCondition() {
            return condition;
        }

        public Object getValue() {
            return value;
        }

        public Object getSecondValue() {
            return secondValue;
        }

        public boolean isNoValue() {
            return noValue;
        }

        public boolean isSingleValue() {
            return singleValue;
        }

        public boolean isBetweenValue() {
            return betweenValue;
        }

        public boolean isListValue() {
            return listValue;
        }

        public String getTypeHandler() {
            return typeHandler;
        }

        protected Criterion(String condition) {
            super();
            this.condition = condition;
            this.typeHandler = null;
            this.noValue = true;
        }

        protected Criterion(String condition, Object value, String typeHandler) {
            super();
            this.condition = condition;
            this.value = value;
            this.typeHandler = typeHandler;
            if (value instanceof List<?>) {
                this.listValue = true;
            } else {
                this.singleValue = true;
            }
        }

        protected Criterion(String condition, Object value) {
            this(condition, value, null);
        }

        protected Criterion(String condition, Object value, Object secondValue, String typeHandler) {
            super();
            this.condition = condition;
            this.value = value;
            this.secondValue = secondValue;
            this.typeHandler = typeHandler;
            this.betweenValue = true;
        }

        protected Criterion(String condition, Object value, Object secondValue) {
            this(condition, value, secondValue, null);
        }
    }
}