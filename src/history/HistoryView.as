package history
{
	import flash.events.MouseEvent;
	import flash.text.TextField;
	import flash.utils.setTimeout;
	
	import Components.InfoBar;
	import Components.InfoType;
	
	import coco.component.Button;
	import coco.component.Scroller;
	import coco.component.TextInput;
	import coco.component.ToggleSwitch;
	import coco.component.VGroup;
	import coco.core.UIComponent;
	
	public class HistoryView extends UIComponent
	{
		public function HistoryView()
		{
			super();
			
			height = 300;
			width = 300;
		}
		
		private var textField : TextField;
		private var infoMessage : Vector.<InfoBar> = new Vector.<InfoBar>(); 
		private var vg : VGroup;
		private var scroller : Scroller;
		private var testInput1 : TextInput;
		private var testInput2 : TextInput;
		private var testInput3 : TextInput;
		private var templateText : TextField;
		override protected function createChildren():void
		{
			super.createChildren();
			
			scroller = new Scroller();
			scroller.autoDrawSkin = true;
			scroller.width = 300;
			scroller.height = 300;
			scroller.verticalScrollEnabled = true;
			scroller.horizontalScrollEnabled = false;
			addChild(scroller);
			
			vg = new VGroup();
			vg.width = 280;
			vg.gap = 20;
			vg.backgroundColor = 0xff0000;
			scroller.addChild(vg);
			
			var button : Button = new Button();
			button.label = "add";
			button.x = 300;
			button.addEventListener(MouseEvent.CLICK,addHandler);
			addChild(button);
		}
		
		protected function addHandler(event:MouseEvent):void
		{
			
			var roleArray : Array = ["teacher","student","robot"]; //角色
			var typeArray : Array = ["question","speak"]; //对话类型
			var content : String = "“当前经济运行稳中有变，面临一些新问题新挑战，外部环境发生明显变化”。" +
				"7月31日，中共中央政治局召开会议，在充分肯定上半年经济保持总体平稳、稳中向好态势的同时，" +
				"科学分析研究了当前经济运行面临的新问题新挑战，提出了一系列具有针对性的解决办法，" +
				"为确保实现经济社会发展目标任务提供了基本遵循，彰显了以习近平同志为核心的党中央驾驭中国经济的高超能力和战略定力。";
			
			var roleIndex : int = int(Math.random()*roleArray.length); 
			var typeIndex : int = int(Math.random()*typeArray.length);
			var subContent : String = content.substr(0, int(Math.random()*content.length/2));
			
			if(roleArray[roleIndex]!='robot'&&typeArray[typeIndex]=='question')
			{
			    typeArray[typeIndex] = 'speak';
			}
			
			var infoItem : InfoBar = new InfoBar();
			//模拟获取数据
			var dataObj : InfoType = new InfoType();
			dataObj.role = roleArray[roleIndex];
			dataObj.type = typeArray[typeIndex];
			dataObj.message = subContent;
			trace("数据："+JSON.stringify(dataObj));
			
			infoItem.talkInfo = dataObj;
			vg.addChild(infoItem);
			
			//计算infobar的高度通过 字数
			var line : uint = Math.ceil(infoItem.talkInfo.message.length/infoItem.oneLineWord)
			if(line==0) line = 1;
			var infobarHight : uint = 15*line+20-line + 14;
			//通过infobar的数量和高度计算vg的高度
			getHighVGValue(infobarHight);
//			trace("计算行高："+infobarHight);
		}
		
		private function getHighVGValue(infobarHight:uint):void
		{
			vg.height = vg.height+vg.gap+infobarHight;
			setTimeout(function abc(): void { scroller.verticalScrollPosition = scroller.maxVerticalScrollPosition; },10)
//			scroller.verticalScrollPosition = scroller.maxVerticalScrollPosition;
		}
		
	}
}