package main;

public class PaginationDTO {
	public static int pageSize = 10; // �� �������� ���� �Խñ� ����
	public static int paginationSize = 10;  // 10��¥�� ���� ����ִ� ����Ʈ�� ����� �����ٰ��ΰ�.
	
	public PaginationDTO init(String pg, int countAll ) {
		curPagination = ((pg==null || pg.equals(""))? 1 : Integer.parseInt(pg));
		// ���� �������� ���޵Ǵ� ���� ���ų�, ������ ���� ���� �������� ������ �ȵ� ���̱� ������ �⺻�� 1 ����. ���޵Ǵ� ���� ���� ��� ���� ���ڰ� ���� ������.
		
		numPages = ((countAll -1 ) /pageSize ) +1; 
		//�������� ��ü ������ ��ü �� ���� -1 �Ѱ� ���ٰ� 1�� ���ؾ���.
		// ��ü �� ���� -1�� ������ 9���� 10������ ��. 10���� ������ ��� 1~10�������� 1�� �������� ������. 
		/* 9�� �Խñ��� ��� -1�� ���� �ʾƵ� 9�� 10���� ������ �� 0 ������ 9�̱� ������ 1�� �������� ��.
		 * ������ 10���� ��� -1�� ���� ������ 10/10 ���� 1 �������� 0�̱� ������ 2�������� ��. ���� -1�� ���ִ� �̴ϴ�.
		 *  �������� +1�� ���ִ� ������ ������ �� �� ó�� ���� 0�� ������ ������ ���� 1�� ����� �ֱ� ���� +1 ���ִ� ��!
		 */
		
		paginationStart = ((curPagination-1)/paginationSize)*pageSize + 1;
		paginationEnd = paginationStart + paginationSize -1;
		if(numPages<paginationEnd){
			paginationEnd = numPages;
		} 
		// ��ü ������ �������� ���������̼� ������ ���� ũ�� �Խñ��� ���� ���������̼��� ����.
		// ���� ��ü ������ �������� ���� �ֵ��� ���ֱ� ���� ���������̼� ���� ���� ��ü ������ ������ ����.
		return this;
	}
	
	private int curPagination = 1;//���� ������
	private int numPages = 1;//��ü ������ ����
	
	private int paginationStart = 0;  // �ʱ�ȭ
	private int paginationEnd = 0; // �ʱ�ȭ
	
	private boolean hasPrevPagination;
	private boolean hasNextPagination;
	
	
	public void setHasPrevPagination(boolean hasPrevPagination) {
		this.hasPrevPagination = hasPrevPagination;
	}
	public void setHasNextPagination(boolean hasNextPagination) {
		this.hasNextPagination = hasNextPagination;
	}
	public int getCurPagination(){return curPagination;} // ���� ������ ��ȯ���ִ� �޼ҵ�
	public int getPaginationStart(){return paginationStart;} // ���������̼� ��ŸƮ �� ��ȯ
	public int getPaginationEnd(){return paginationEnd;} // ���������̼� ���� �� ��ȯ
	
	public boolean getHasPrevPagination(){return paginationStart != 1;} // �������� 1�������� �ƴϸ� �����±� ����
	public boolean getHasNextPagination(){return paginationEnd != numPages;} // �������� ��ü ������ ��(�� ������)�� ���� ������ �����±� ����
	
	public int getSkip(){
		return ( curPagination == 1 ) ? 0 : (curPagination -1 ) * paginationSize;
	}
	
}
