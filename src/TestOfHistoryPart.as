package
{
	import coco.core.Application;
	
	import history.HistoryView;
	
	public class TestOfHistoryPart extends Application
	{
		public function TestOfHistoryPart()
		{
			var historyView : HistoryView = new HistoryView();
			addChild(historyView);
		}
	}
}