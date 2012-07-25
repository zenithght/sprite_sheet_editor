package ctrl
{
import events.SSEvent;

import flash.display.BitmapData;

import model.SpriteSheetModel;

import org.robotlegs.mvcs.Command;

/**
 * 显示修剪
 * @author zrong
 * 
 */
public class PreviewSSDisChangeCmd extends Command
{
	[Inject] public var ssModel:SpriteSheetModel;
	
	override public function execute():void
	{
		updateFrameDisplay();
	}
	
	/**
	 * 更新帧显示
	 */
	private function updateFrameDisplay():void
	{
		var __frameBmd:BitmapData = null;
		//根据选择显示原始的或者修剪过的Frame
		/*
		__frameBmd = disFrameRB.selected ? 
		Global.instance.adjustedSheet.getBMDByIndex(framesAndLabels.selectedFrameIndex) : 
		Global.instance.sheet.getBMDByIndex(framesAndLabels.selectedFrameIndex);*/
		if(ssModel.displayCrop)
			__frameBmd = ssModel.adjustedSheet.getTrimBMDByIndex(ssModel.selectedFrameIndex);
		else
			__frameBmd = ssModel.adjustedSheet.getBMDByIndex(ssModel.selectedFrameIndex);
		trace('更新帧：', __frameBmd.rect, ssModel.displayCrop);
		dispatch(new SSEvent(SSEvent.PREVIEW_SS_SHOW, __frameBmd));
	}
}
}